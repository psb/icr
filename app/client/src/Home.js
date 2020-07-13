import React, { useState, useEffect } from "react";
import FeatureText from "./FeatureText";

function Home() {
  const [genes, setGenes] = useState([]);
  const [filteredGenes, setFilteredGenes] = useState([]);
  const [loading, setLoading] = useState(true);
  const [error, setError] = useState(null);
  const [showDrugTargets, setShowDrugTargets] = useState(true);
  const [showEnzymes, setShowEnzymes] = useState(true);

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
        const newData = json.filter(
          (gene) =>
            gene.is_druggable === showDrugTargets ||
            gene.is_enzyme === showEnzymes
        );
        setFilteredGenes(newData);
      })
      .catch((err) => {
        console.error(err);
        setError(err);
      })
      .finally(() => {
        setLoading(false);
      });
  }, []);

  function toggleShowDrugTargets() {
    const newData = genes.filter(
      (gene) =>
        gene.is_druggable === !showDrugTargets || gene.is_enzyme === showEnzymes
    );
    setFilteredGenes(newData);
    setShowDrugTargets(!showDrugTargets);
  }

  function toggleShowEnzymes() {
    const newData = genes.filter(
      (gene) =>
        gene.is_enzyme === !showEnzymes || gene.is_druggable === showDrugTargets
    );
    setFilteredGenes(newData);
    setShowEnzymes(!showEnzymes);
  }

  if (loading) {
    return "Loading data...";
  } else if (error) {
    return "Error loading data.";
  } else {
    return (
      <>
        {/* Start feature filters */}
        <div className="row mb-3">
          <div className="col-auto ml-4">
            <input
              type="checkbox"
              class="form-check-input"
              id="drugTargets"
              aria-label="Checkbox to show drug targets"
              checked={showDrugTargets}
              onClick={toggleShowDrugTargets}
            />
            <label class="form-check-label" for="drugTargets">
              Show drug targets
            </label>
          </div>
          <div className="col-auto ml-4">
            <input
              type="checkbox"
              class="form-check-input"
              id="enzymes"
              aria-label="Checkbox to show enzymes"
              checked={showEnzymes}
              onClick={toggleShowEnzymes}
            />
            <label class="form-check-label" for="enzymes">
              Show enzymes
            </label>
          </div>
        </div>
        {/* End feature filters */}
        {/* Start gene cards */}
        <div className="row">
          {filteredGenes.map((gene) => (
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
                    <FeatureText hasFeature={gene.is_druggable} />
                  </li>
                  <li className="list-group-item">
                    Is an enzyme?
                    <FeatureText hasFeature={gene.is_enzyme} />
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
        {/* End gene cards */}
      </>
    );
  }
}

export default Home;
