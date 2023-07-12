import type { Request, Response } from 'express'

export default function (req: Request, res: Response) {
  res.setHeader('Content-Type', 'text/html')
  res.status(200).send(`
    <ul>
      <li>req.url: ${req.url}</li>
      <li>req.method: ${req.method}</li>
      <li>req.query: ${JSON.stringify(req.query)}</li>
    </ul>
  `);
}
