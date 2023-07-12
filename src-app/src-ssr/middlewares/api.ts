import { ssrMiddleware } from 'quasar/wrappers';
import type { Request, Response } from 'express'
import routes from '../../src/api/_routes'

export default ssrMiddleware(async ({ app, resolve }) => {
  app.all(resolve.urlPath('*'), async (req: Request, res: Response, next) => {
    // console.log(`>> req.url: ${req.url}`)

    const pathname = req.url.split('?')[0]
    if (!pathname || !pathname.startsWith('/api')) {
      return next()
    }

    const path = pathname.substring(4)
    if (!Object.keys(routes).includes(path)) {
      res.sendStatus(404).end()
      return
    }

    console.log(`API hit on ${path}`)

    try {
      const handler = (await routes[path as keyof typeof routes]()).default
      handler(req, res)
    } catch(err) {
      console.error(err)
      res.sendStatus(500).end()
    }
  });
});
