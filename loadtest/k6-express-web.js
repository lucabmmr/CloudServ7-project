import http from 'k6/http';

const BASE_URL = __ENV.TARGET_URL;

export const options = {
  stages: [
    { duration: '20s', target: 20 },
    { duration: '40s', target: 60 },
    { duration: '40s', target: 100 },
    { duration: '40s', target: 150 },
    { duration: '40s', target: 0 },
  ],
};

export default function () {
  http.get('http://' + BASE_URL);
}
