import fastify, {FastifyReply, FastifyRequest} from "fastify";

const app = fastify({ logger: true });

app
    .get('/', (request: FastifyRequest, reply: FastifyReply) => {
        reply.send({ message: 'Dockerizando uma aplicação typescript'});
    })
    .get('/test', (request: FastifyRequest, reply: FastifyReply) => {
        reply.send({message: 'Rota de teste pra saber se está funcionando'});
    });

app.listen(
    {port: 8080, host: '0.0.0.0'},
    (err: Error | null, address: string) => console.log(`${err?.message} - ${address}`)
);