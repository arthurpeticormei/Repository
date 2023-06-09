/* RH - MESAGENS MODULE */

CREATE TABLE LISTA_ENVIO
(
	ID INTEGER NOT NULL PRIMARY KEY CLUSTERED IDENTITY,
	NOME_LISTA VARCHAR (50) NOT NULL,
	ID_CC INTEGER NOT NULL,
	CREATION_USER VARCHAR (50) NOT NULL,
	UPDATE_USER VARCHAR (50),
	CREATION_DATE SMALLDATETIME NOT NULL,
	UPDATE_DATE SMALLDATETIME,
	[VERSION] TIMESTAMP NOT NULL
);

CREATE TABLE TEXTO_PADRAO
(
	ID INTEGER NOT NULL PRIMARY KEY CLUSTERED IDENTITY,
	ASSUNTO VARCHAR (120) NOT NULL,
	OBJETIVO VARCHAR (200) NOT NULL,
	TEXTO_MSG TEXT NOT NULL,
	ID_CC INTEGER NOT NULL,
	CREATION_USER VARCHAR (50) NOT NULL,
	UPDATE_USER VARCHAR (50),
	CREATION_DATE SMALLDATETIME NOT NULL,
	UPDATE_DATE SMALLDATETIME,
	[VERSION] TIMESTAMP NOT NULL
);

CREATE TABLE MENSAGEM
(
	ID INTEGER NOT NULL PRIMARY KEY CLUSTERED IDENTITY,
	ID_TEXTO_PADRAO INTEGER REFERENCES TEXTO_PADRAO (ID),
	ASSUNTO VARCHAR (120) NOT NULL,
	OBJETIVO VARCHAR (200) NOT NULL,
	TEXTO_MSG TEXT NOT NULL,
	DH_AGENDA SMALLDATETIME,
	DH_ENVIO SMALLDATETIME,
	SEND_BY_SMS BIT NOT NULL,
	SEND_BY_WA BIT NOT NULL,
	SEND_BY_EMAIL BIT NOT NULL,
	ID_CC INTEGER NOT NULL,
	CREATION_USER VARCHAR (50) NOT NULL,
	UPDATE_USER VARCHAR (50),
	CREATION_DATE SMALLDATETIME NOT NULL,
	UPDATE_DATE SMALLDATETIME,
	[VERSION] TIMESTAMP NOT NULL
);

CREATE TABLE MENSAGEM_INDIVIDUAL
(
	ID INTEGER NOT NULL PRIMARY KEY CLUSTERED REFERENCES MENSAGEM (ID) ON UPDATE CASCADE ON DELETE CASCADE,
	ID_PESSOA INTEGER REFERENCES PESSOA (ID)
);

CREATE TABLE MEMBROS_LISTA_ENVIO
(
	ID_LISTA_ENVIO INTEGER NOT NULL REFERENCES LISTA_ENVIO (ID),
	ID_PESSOA INTEGER NOT NULL REFERENCES PESSOA (ID),
	PRIMARY KEY CLUSTERED (ID_LISTA_ENVIO, ID_PESSOA)
);

CREATE TABLE MENSAGEM_TO_LISTA
(
	ID INTEGER NOT NULL PRIMARY KEY CLUSTERED REFERENCES MENSAGEM (ID) ON UPDATE CASCADE ON DELETE CASCADE,
	ID_LISTA_ENVIO INTEGER REFERENCES LISTA_ENVIO (ID)
);
