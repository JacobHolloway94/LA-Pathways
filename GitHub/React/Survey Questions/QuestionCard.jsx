import React from "react";
import PropTypes from "prop-types";
import "./SurveyQuestions.css";

const QuestionCard = props => {
  const goToEditForm = () => {
    props.goToEditForm(props.question);
  };
  return (
    <div className="card col-10 offset-1">
      <div className="card-header">
        <div className="row">
          <div className="ribbon ribbon-clip ribbon-primary ribbonExtras">
            {props.question.questionText}
          </div>
        </div>
        <div className="row">
          <button
            type="button"
            className="btn btn-pill ml-auto btn-secondary"
            onClick={goToEditForm}
          >
            Edit
          </button>
        </div>
      </div>
      <div className="card-body">
        <div className="row">
          <div className="col center">
            <p className="mb-3">{props.question.helpText}</p>
          </div>
          <div className="col center">
            <p className="mb-0 ml-1">
              <span className="bold">Question Type: </span>
              {props.question.questionTypeName}
            </p>
            <p className="mb-0 ml-1">
              <span className="bold">Section: </span>
              {props.question.sectionName}
            </p>
          </div>
          <div className="col center">
            <p className="mb-0">
              {" "}
              <span className="bold">Required Question: </span>
              {props.question.isRequired === false ? "No" : "Yes"}
            </p>
            <p className="mb-0">
              <span className="bold">Multiple Answers: </span>
              {props.question.isMultipleAllowed === false ? "No" : "Yes"}
            </p>
          </div>
        </div>
        <div className="row">
          <p className="mr-auto">
            <strong>Status: </strong>
            {props.question.statusName + " "}
            {props.question.statusId === 1 ? (
              <i className="fa fa-circle text-success" />
            ) : props.question.statusId === 2 ? (
              <i className="fa fa-circle text-danger" />
            ) : (
              ""
            )}
          </p>
        </div>
      </div>
    </div>
  );
};

QuestionCard.propTypes = {
  question: PropTypes.shape({
    questionText: PropTypes.string,
    helpText: PropTypes.string,
    questionTypeId: PropTypes.number,
    questionTypeName: PropTypes.string,
    sectionId: PropTypes.number,
    sectionName: PropTypes.string,
    statusId: PropTypes.number,
    statusName: PropTypes.string,
    sortOrder: PropTypes.number,
    isRequired: PropTypes.bool,
    isMultipleAllowed: PropTypes.bool
  }),
  goToEditForm: PropTypes.func
};

export default QuestionCard;
