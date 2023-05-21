-- CreateTable
CREATE TABLE "USUARIO" (
    "id" TEXT NOT NULL,
    "nome" TEXT NOT NULL,
    "email" TEXT NOT NULL,
    "password" TEXT NOT NULL,
    "permissao" TEXT NOT NULL,

    CONSTRAINT "USUARIO_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "EMPRESA" (
    "id" TEXT NOT NULL,
    "cnpj_cpf" TEXT NOT NULL,
    "nome" TEXT NOT NULL,
    "email" TEXT NOT NULL,
    "telefone" TEXT,

    CONSTRAINT "EMPRESA_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "CLIENTE" (
    "id" TEXT NOT NULL,
    "nome" TEXT NOT NULL,
    "cnpj_cpf" TEXT,
    "telefone" TEXT,
    "ativo" BOOLEAN NOT NULL DEFAULT true,
    "tipo" TEXT NOT NULL,

    CONSTRAINT "CLIENTE_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "RECIBO" (
    "id" TEXT NOT NULL,
    "numero" SERIAL NOT NULL,
    "valor" DECIMAL(65,30) NOT NULL DEFAULT 0,
    "data_competencia" DATE NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "data_pagamento" TIMESTAMP(3),

    CONSTRAINT "RECIBO_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "ENDERECO" (
    "id" TEXT NOT NULL,
    "cep" TEXT NOT NULL,
    "estado" TEXT NOT NULL,
    "cidade" TEXT NOT NULL,
    "bairro" TEXT NOT NULL,
    "rua" TEXT NOT NULL,
    "numero" TEXT NOT NULL,

    CONSTRAINT "ENDERECO_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Responsavel" (
    "id" TEXT NOT NULL,
    "nome" TEXT NOT NULL,
    "identificador" TEXT NOT NULL,

    CONSTRAINT "Responsavel_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "USUARIO_email_key" ON "USUARIO"("email");

-- CreateIndex
CREATE UNIQUE INDEX "EMPRESA_cnpj_cpf_key" ON "EMPRESA"("cnpj_cpf");

-- CreateIndex
CREATE UNIQUE INDEX "EMPRESA_email_key" ON "EMPRESA"("email");

-- CreateIndex
CREATE UNIQUE INDEX "EMPRESA_telefone_key" ON "EMPRESA"("telefone");

-- CreateIndex
CREATE UNIQUE INDEX "CLIENTE_cnpj_cpf_key" ON "CLIENTE"("cnpj_cpf");

-- CreateIndex
CREATE UNIQUE INDEX "CLIENTE_telefone_key" ON "CLIENTE"("telefone");

-- CreateIndex
CREATE UNIQUE INDEX "ENDERECO_cep_key" ON "ENDERECO"("cep");

-- CreateIndex
CREATE UNIQUE INDEX "Responsavel_identificador_key" ON "Responsavel"("identificador");
