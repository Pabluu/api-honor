import { prisma } from '@/lib/prisma'
import { PrismaUsersRepository } from '@/repositories/prisma-users-repository'
import { Prisma } from '@prisma/client'
import { hash } from 'bcryptjs'

interface RegisterUseCaseRequest {
  nome: string
  email: string
  password: string
  permissao: string
  empresa: Prisma.EmpresaCreateNestedOneWithoutUsuarioInput
}

export async function registerUseCase({
  nome,
  email,
  password,
  permissao,
  empresa,
}: RegisterUseCaseRequest) {
  const userWithSameEmail = await prisma.usuario.findUnique({
    where: {
      email,
    },
  })

  if (userWithSameEmail) {
    throw new Error('E-mail já existe')
  }

  password = await hash(password, 6)
  const prismaUsersRepository = new PrismaUsersRepository()

  await prismaUsersRepository.create({
    nome,
    email,
    password,
    permissao,
    empresa,
  })
}
