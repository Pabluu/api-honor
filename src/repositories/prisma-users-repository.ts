import { prisma } from '@/lib/prisma'
import { Prisma } from '@prisma/client'

export class PrismaUsersRepository {
  async create(data: Prisma.UsuarioCreateInput) {
    const user = await prisma.usuario.create({
      data,
    })

    return user
  }
}
