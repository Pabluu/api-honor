import { registerUseCase } from '@/use-cases/register'
import { FastifyReply, FastifyRequest } from 'fastify'
import { z } from 'zod'

export async function register(request: FastifyRequest, reply: FastifyReply) {
  const schemeBody = z.object({
    nome: z.string().max(100),
    email: z.string().email(),
    password: z.string().min(6),
    permissao: z.string().max(20),
    empresa: z.string().uuid(),
  })

  const { nome, email, password, permissao, empresa } = schemeBody.parse(
    request.body,
  )

  try {
    await registerUseCase({
      nome,
      email,
      password,
      permissao,
      empresa,
    })
  } catch (error) {
    return reply.status(409).send(error)
  }

  return reply.status(201).send()
}
