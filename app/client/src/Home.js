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
      <div className="row">
        {genes.map((gene) => (
          <div className="col-3 my-2">
            <div className="card">
              <img
                src={gene.image}
                className="card-img-top"
                alt={gene.short_name}
              />
              <div className="card-body">
                <h4 className="card-title">{gene.short_name}</h4>
              </div>
              <ul className="list-group list-group-flush">
                <li className="list-group-item">
                  Is a drug target?
                  {gene.is_druggable ? (
                    <strong className="text-success"> Yes</strong>
                  ) : (
                    <strong className="text-danger"> No</strong>
                  )}
                </li>
                <li className="list-group-item">
                  Is an enzyme?
                  {gene.is_enzyme ? (
                    <strong className="text-success"> Yes</strong>
                  ) : (
                    <strong className="text-danger"> No</strong>
                  )}
                </li>
              </ul>
              <div className="card-body">
                <a href={"/" + gene.id} className="btn btn-primary btn-block">
                  More information
                </a>
              </div>
            </div>
          </div>
        ))}
      </div>
    );
  }
}

export default Home;
