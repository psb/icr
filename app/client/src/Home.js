import React, { useState, useEffect } from "react";

function Home() {
  const [genes, setGenes] = useState([]);
  const [loading, setLoading] = useState(true);
  const [error, setError] = useState(null);

  useEffect(() => {
    fetch("/api/genes")
      .then((response) => {
        if (response.ok) {
          return response.json();
        } else {
          throw response;
        }
      })
      .then((json) => {
        setGenes(json);
      })
      .catch((err) => {
        console.error(err);
        setError(err);
      })
      .finally(() => {
        setLoading(false);
      });
  }, []);

  if (loading) {
    return "Loading data...";
  } else if (error) {
    return "Error loading data.";
  } else {
    return (
      <ul>
        {genes.map((gene) => (
          <li key={gene.id}>
            <a href={gene.id}>{gene.id}</a>
          </li>
        ))}
      </ul>
    );
  }
}

export default Home;
