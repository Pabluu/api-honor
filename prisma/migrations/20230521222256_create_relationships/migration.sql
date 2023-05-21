/*
  Warnings:

  - Added the required column `empresa_id` to the `CLIENTE` table without a default value. This is not possible if the table is not empty.
  - Added the required column `endereco_id` to the `CLIENTE` table without a default value. This is not possible if the table is not empty.
  - Added the required column `endereco_id` to the `EMPRESA` table without a default value. This is not possible if the table is not empty.
  - Added the required column `responsavel_id` to the `EMPRESA` table without a default value. This is not possible if the table is not empty.
  - Added the required column `cliente_id` to the `RECIBO` table without a default value. This is not possible if the table is not empty.
  - Added the required column `responsavel_id` to the `RECIBO` table without a default value. This is not possible if the table is not empty.
  - Added the required column `empresa_id` to the `USUARIO` table without a default value. This is not possible if the table is not empty.

*/
-- AlterTable
ALTER TABLE "CLIENTE" ADD COLUMN     "empresa_id" TEXT NOT NULL,
ADD COLUMN     "endereco_id" TEXT NOT NULL;

-- AlterTable
ALTER TABLE "EMPRESA" ADD COLUMN     "endereco_id" TEXT NOT NULL,
ADD COLUMN     "responsavel_id" TEXT NOT NULL;

-- AlterTable
ALTER TABLE "RECIBO" ADD COLUMN     "cliente_id" TEXT NOT NULL,
ADD COLUMN     "responsavel_id" TEXT NOT NULL;

-- AlterTable
ALTER TABLE "USUARIO" ADD COLUMN     "empresa_id" TEXT NOT NULL;

-- AddForeignKey
ALTER TABLE "USUARIO" ADD CONSTRAINT "USUARIO_empresa_id_fkey" FOREIGN KEY ("empresa_id") REFERENCES "EMPRESA"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "EMPRESA" ADD CONSTRAINT "EMPRESA_endereco_id_fkey" FOREIGN KEY ("endereco_id") REFERENCES "ENDERECO"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "EMPRESA" ADD CONSTRAINT "EMPRESA_responsavel_id_fkey" FOREIGN KEY ("responsavel_id") REFERENCES "Responsavel"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "CLIENTE" ADD CONSTRAINT "CLIENTE_empresa_id_fkey" FOREIGN KEY ("empresa_id") REFERENCES "EMPRESA"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "CLIENTE" ADD CONSTRAINT "CLIENTE_endereco_id_fkey" FOREIGN KEY ("endereco_id") REFERENCES "ENDERECO"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "RECIBO" ADD CONSTRAINT "RECIBO_cliente_id_fkey" FOREIGN KEY ("cliente_id") REFERENCES "CLIENTE"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "RECIBO" ADD CONSTRAINT "RECIBO_responsavel_id_fkey" FOREIGN KEY ("responsavel_id") REFERENCES "Responsavel"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
