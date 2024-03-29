import React, { Component } from "react";
import * as services from "../../services/questionServices";
import QuestionCard from "./QuestionCard";
import { toast } from "react-toastify";
import Pagination from "rc-pagination";
import "rc-pagination/assets/index.css";
import PropTypes from "prop-types";

export default class QuestionPage extends Component {
  constructor() {
    super();
    this.state = {
      isEditing: false,
      currentPage: 0,
      pageSize: 8
    };
  }

  componentDidMount() {
    services
      .getPaginate(this.state.currentPage)
      .then(this.onGetQuestionsSuccess)
      .catch(this.axiosFail);
  }

  onGetQuestionsSuccess = data => {
    let questions = data.item.pagedItems;
    let totalCount = data.item.totalCount;
    this.setState(prevState => {
      return { ...prevState, questions, totalCount: totalCount };
    });
  };

  goToAddForm = () => {
    this.props.history.push("/admin/survey/questions/addquestion");
  };

  goToEditForm = question => {
    this.props.history.push(
      `/admin/survey/questions/${question.id}/edit`,
      question
    );
  };

  onPageChange = page => {
    this.setState(prevState => {
      return { ...prevState, currentPage: page - 1 };
    });
    services
      .getPaginate(page - 1)
      .then(this.onGetQuestionsSuccess)
      .catch(this.axiosFail);
  };

  mapQuestionCards = question => (
    <QuestionCard
      goToEditForm={this.goToEditForm}
      question={question}
      key={question.id}
    />
  );

  axiosFail = error => {
    toast.error(error.message);
  };

  render() {
    return (
      <div className="container-fluid mt-3">
        <div className="row pt-3">
          <button
            type="button"
            className="offset-9 btn btn-pill btn-primary "
            onClick={this.goToAddForm}
          >
            <i className=" mr-2 fas fa-plus-square fa" />
            Add Question
          </button>
        </div>
        <div className="mt-4">
          {this.state.questions
            ? this.state.questions.map(this.mapQuestionCards)
            : "No questions found."}
        </div>
        <div className="row">
          <Pagination
            className="m-auto"
            current={this.state.currentPage + 1}
            total={this.state.totalCount}
            onChange={this.onPageChange}
            pageSize={this.state.pageSize}
            showTitle={false}
            hideOnSinglePage={true}
          />
        </div>
      </div>
    );
  }
}

QuestionPage.propTypes = {
  history: PropTypes.shape({ push: PropTypes.func })
};
