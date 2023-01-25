# Astro Express Middleware

I'm trying to run astro SSR as an express middleware using typescript.

## What works

Run `npm i` to install packages. 

Run `npm run build` to build the astro .mjs express middleware module.

Run `npm run start` to use `ts-node` to transpile and run `/server.ts`.

## Where I'm stuck

I want to fully separate build-time from run-time.

I would like to run something like `tsc server.ts` to transpile the whole express server into javascript code at build time.

I would then like to run `node dist/server.js` to run without having to compile typescript at startup.

