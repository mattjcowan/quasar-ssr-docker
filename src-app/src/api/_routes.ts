const routes = {
  '/ping': () => import('./ping'),
  '/version': () => import('./version'),
  '/request': () => import('./req-info'),
}

export default routes
