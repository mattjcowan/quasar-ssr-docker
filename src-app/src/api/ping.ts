import type { Request, Response } from 'express'

export default function (req: Request, res: Response) {
  res.status(200).send('pong')
}
