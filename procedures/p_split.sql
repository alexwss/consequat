--SELECT * FROM P_SPLIT('TESTE' || ASCII_CHAR(13) || 'TESTA',ASCII_CHAR(13));
--SELECT osplit valor FROM P_SPLIT('TESTE' || ASCII_CHAR(13) || 'TESTA',ASCII_CHAR(13));
--
--for loop
--http://www.janus-software.com/fbmanual/manual.php?book=psql&topic=97
SET TERM ^ ;

CREATE PROCEDURE P_SPLIT (
    itexto BLOB SUB_TYPE TEXT SEGMENT SIZE 100,
    iseparador CHAR(1))
RETURNS (
    osplit VARCHAR(32000))
AS
/*
* Autor:        Fabricio
* Data:         2009/11/23
* Desc:         Simula a função split comum nas linguagens de programação
* Parâmetros:
*   @itexto         String contendo o texto que irá ser separado
*   @iseparador     Caracter que será utilizado para separar o texto recebido
* 
* Fonte: https://firebirdlikebrasil.wordpress.com/2010/02/02/split/
*/
DECLARE VARIABLE vtexto           BLOB SUB_TYPE TEXT SEGMENT SIZE 100;
DECLARE VARIABLE vposicao         INTEGER;
DECLARE VARIABLE vposicao_inicial INTEGER;
DECLARE VARIABLE vsplit           BLOB SUB_TYPE TEXT SEGMENT SIZE 100;
BEGIN
    vtexto = itexto;
    vposicao_inicial = 1;
    vposicao = 1;
    
    IF (iseparador IS NULL OR itexto IS NULL) THEN
    BEGIN
        -- Sai da função sem executar
    END
    ELSE
    BEGIN
        WHILE (OCTET_LENGTH (vtexto) > 0) DO
        BEGIN
            vposicao = POSITION (:iseparador, vtexto, vposicao_inicial);
            IF (vposicao <= 0) THEN
            BEGIN
                vsplit = SUBSTRING (:vtexto FROM :vposicao_inicial FOR
                        OCTET_LENGTH  (:vtexto) - vposicao_inicial + 1);
                IF (NOT :vsplit IS NULL AND NOT :vsplit = '') THEN
                BEGIN
                    osplit = :vsplit;   
                    SUSPEND;
                END
                BREAK;
            END
            vsplit = SUBSTRING (:vtexto FROM :vposicao_inicial
                    FOR :vposicao - vposicao_inicial);
            IF (NOT :vsplit IS NULL AND NOT :vsplit = '') THEN
            BEGIN
                osplit = :vsplit;   
            END
            vsplit = NULL;
            vposicao_inicial = :vposicao + 1;
            SUSPEND;
        END
    END
END^

SET TERM ; ^
