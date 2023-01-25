import express from 'express';
import { handler as ssrHandler } from './dist/server/entry.mjs';

const app = express();
app.use(express.static('dist/client/'))
app.use(ssrHandler);

let port = 8080;

app.listen(port);
console.log(`Listening on port ${port}`);
