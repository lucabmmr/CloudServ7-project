// HTTP-Modul von k6 wird importiert
import http from 'k6/http';

// URL unserer Webseite, um Zugriffe darauf simulieren zu können
const BASE_URL = __ENV.TARGET_IP;

// Erklärung: 
// duration: Zeit, in der auf x targets hochskaliert werden soll
// target: Anzahl der (gleichzeitigen) virtuellen User, die erreicht werden soll
// stages: werden nacheinander ausgeführt
export const options = {
  stages: [
    { duration: '20s', target: 20 },
    { duration: '40s', target: 60 },
    { duration: '40s', target: 100 },
    { duration: '40s', target: 150 },
    { duration: '40s', target: 0 },
  ],
};

// Aufruf jedes virtuellen Users
export default function () {
  http.get('http://' + BASE_URL);
}
