import type { Request, Response } from 'express'

export default function (req: Request, res: Response) {
  const version = require('../../package.json').version
  res.status(200).send(version)
}
