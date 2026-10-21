const request = require('supertest');
const buildApp = require('../app');

it('create a user', async () => {
  await request(buildApp())
    .post('/users')
    .send({ username: 'testuser', bio: 'test bio.' })
    .expect(200);
});
