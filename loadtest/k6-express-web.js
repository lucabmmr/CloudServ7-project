import http from 'k6/http';

export const options = {
  stages: [
    { duration: '30s', target: 20 },
    { duration: '30s', target: 40 },
    { duration: '30s', target: 60 },
    { duration: '30s', target: 80 },
    { duration: '30s', target: 0 },
  ],
};

export default function () {
  http.get('http://10.32.6.161');
}
