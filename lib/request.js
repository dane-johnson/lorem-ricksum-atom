const API_URL = 'http://loremricksum.com/api';

export const fetchText = (paragraphs = 1, quotes = 1) => {
  const reqConfig = {
    method: 'GET',
  };
  fetch(`${API_URL}/?paragraphs=${paragraphs}&quotes=${quotes}`, reqConfig)
    .then((res) => {
      res.json().then(({ data }) => data);
    }, (err) => {
      throw err;
    });
};