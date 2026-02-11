import http from 'k6/http';

export const options = {
  stages: [
    { duration: '20s', target: 0 },
    { duration: '30s', target: 150 },
    { duration: '30s', target: 200 },
    { duration: '30s', target: 0 },
  ],
};

export default function () {
  http.get('http://10.32.6.161');
}
