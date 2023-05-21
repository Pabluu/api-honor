import { prisma } from '@/lib/prisma'
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

  await prisma.usuario.create({
    data: {
      nome,
      email,
      permissao,
      password,
      empresa_id,
    },
  })

  return reply.status(201).send()
}
