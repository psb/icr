import React from "react";

function FeatureText(props) {
  if (props.hasFeature) {
    return <strong className="text-success"> Yes</strong>;
  } else {
    return <strong className="text-danger"> No</strong>;
  }
}

export default FeatureText;
