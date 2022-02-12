import { app } from './app';

const port = process.env.PORT || 3000;

console.log('API [port]', port);
console.log('API [dummy var]', process.env.DUMMY);

// Start server
app.listen(port, () => console.log(`Server is listening on port ${port}!`));
