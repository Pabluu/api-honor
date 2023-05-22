import { prisma } from '@/lib/prisma'
import { hash } from 'bcryptjs'
import { FastifyReply, FastifyRequest } from 'fastify'
import { z } from 'zod'

export async function register(request: FastifyRequest, reply: FastifyReply) {
  const schemeBody = z.object({
    nome: z.string().max(100),
    email: z.string().email(),
    password: z.string().min(6),
    permissao: z.string().max(20),
    empresa_id: z.string().uuid(),
  })

  const { nome, email, password, permissao, empresa_id } = schemeBody.parse(
    request.body,
  )

  const userWithSameEmail = await prisma.usuario.findUnique({
    where: {
      email,
    },
  })

  if (userWithSameEmail) {
    return reply.status(409).send()
  }

  const password_hash = await hash(password, 6)

  await prisma.usuario.create({
    data: {
      nome,
      email,
      password: password_hash,
      permissao,
      empresa_id,
    },
  })

  return reply.status(201).send()
}
