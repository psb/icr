import React, { useState, useEffect } from "react";
import {
  BarChart,
  Bar,
  XAxis,
  YAxis,
  Tooltip,
  Legend,
  ResponsiveContainer,
} from "recharts";
import FeatureText from "./FeatureText";

function Gene(props) {
  const [gene, setGene] = useState({});
  const [loading, setLoading] = useState(true);
  const [error, setError] = useState(null);
  const [isOpen, setIsOpen] = useState(false);

  useEffect(() => {
    fetch("/api/genes/" + props.match.params.geneId)
      .then((response) => {
        if (response.ok) {
          return response.json();
        } else {
          throw response;
        }
      })
      .then((json) => {
        // Need to convert publications arrays into objects for recharts.
        const publications = json.publications.map(([year, count]) => {
          return { year: year, count: count };
        });
        json.publications = publications;
        setGene(json);
      })
      .catch((err) => {
        console.error(err);
        setError(err);
      })
      .finally(() => {
        setLoading(false);
      });
  }, []);

  const toggleDescription = () => setIsOpen(!isOpen);

  if (loading) {
    return "Loading data...";
  } else if (error) {
    return "Error loading data.";
  } else {
    return (
      <>
        <div className="row my-1">
          <div className="col">
            <h3>
              {gene.full_name} ({gene.id})
            </h3>
          </div>
        </div>
        {/* Begin description */}
        <div className="row my-1">
          <div className="col">
            <div className="accordion">
              <div className="card">
                <div className="card-header" id="description">
                  <h2 className="mb-0">
                    <button
                      className="btn btn-link btn-block text-left text-body"
                      type="button"
                      aria-expanded={isOpen}
                      aria-controls="collapseDescription"
                      onClick={toggleDescription}
                    >
                      {isOpen ? "Hide " : "Show "} Description
                    </button>
                  </h2>
                </div>
                <div
                  id="collapseDescription"
                  className={"collapse " + (isOpen ? "show" : "")}
                  aria-labelledby="description"
                >
                  <div className="card-body">{gene.description}</div>
                </div>
              </div>
            </div>
          </div>
        </div>
        {/* End description */}
        <div className="row my-3 align-items-center">
          <div className="col-3">
            <img src={gene.image} alt={gene.short_name} />
          </div>
          {/* Start characteristics card */}
          <div className="col-4">
            <div className="card">
              <ul className="list-group list-group-flush">
                <li className="list-group-item">Family: {gene.family}</li>
                <li className="list-group-item">
                  Is a drug target?
                  <FeatureText hasFeature={gene.is_druggable} />
                </li>
                <li className="list-group-item">
                  Is an enzyme?
                  <FeatureText hasFeature={gene.is_enzyme} />
                </li>
                <li className="list-group-item">
                  Number of structures identified: {gene.num_structures}
                </li>
                <li className="list-group-item">
                  Number of compounds tested: {gene.num_compounds}
                </li>
              </ul>
            </div>
          </div>
          {/* End characteristics card */}
          {/* Start publications chart */}
          <div className="col">
            <ResponsiveContainer height={250} width="100%">
              <BarChart data={gene.publications}>
                <XAxis dataKey="year" />
                <YAxis />
                <Tooltip />
                <Bar
                  dataKey="count"
                  fill="#a71d31"
                  barSize={10}
                  name="publications"
                />
                <Legend
                  verticalAlign="top"
                  height={36}
                  name="no. of publications / year"
                />
              </BarChart>
            </ResponsiveContainer>
          </div>
          {/* End publications chart */}
        </div>
      </>
    );
  }
}

export default Gene;
