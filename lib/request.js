'use babel'
const API_URL = 'http://loremricksum.com/api';

export const fetchText = (paragraphs = 1, quotes = 1) => {
  const reqConfig = {
    method: 'GET',
  };
  return fetch(`${API_URL}/?paragraphs=${paragraphs}&quotes=${quotes}`, reqConfig)
    .then((res) => {
      return res.json().then(({ data }) => data);
    }, (err) => {
      return ["Something's wrong Morty! I can't connect to the internet Morty!"]
    });
};
