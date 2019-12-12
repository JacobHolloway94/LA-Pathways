import React from "react";
import PropTypes from "prop-types";
import * as services from "../../services/questionServices";
import { Formik, Field, Form } from "formik";
import { toast } from "react-toastify";
import ValidationSchema from "./surveyQuestionsValidationSchema";
import "./SurveyQuestions.css";
import { FormGroup } from "reactstrap";

export default class QuestionForm extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      isEditing: false,
      formData: {
        questionText: "",
        helpText: "",
        isRequired: "0",
        isMultipleAllowed: "0",
        questionTypeId: "0",
        sectionId: "0",
        statusId: "0",
        sortOrder: "0"
      },
      questionTypes: [<option key={0}>Select Option</option>],
      sectionTitles: []
    };
  }

  componentDidMount() {
    services
      .getQuestionOptionDetails()
      .then(this.onGetDetailsSuccess)
      .catch(this.axiosFail);

    let id = parseInt(this.props.match.params.id);
    if (id) {
      if (this.props.history.location.state) {
        this.setState(prevState => {
          return {
            ...prevState,
            isEditing: true,
            formData: this.props.history.location.state
          };
        });
      } else {
        services
          .getById(id)
          .then(this.onGetQByIdSuccess)
          .catch(this.axiosFail);
      }
    }
  }

  onGetDetailsSuccess = data => {
    this.onGetSuccess(data.item.questionTypes);
    this.onTitleSuccess(data.item.sections);
    this.onStatusIdSuccess(data.item.statuses);
  };

  onGetSuccess = data => {
    let questionTypes = this.state.questionTypes.concat(
      data.map(this.mapSectionIdAndStatusId)
    );
    this.setState(prevState => {
      return {
        ...prevState,
        questionTypes
      };
    });
  };

  onStatusIdSuccess = data => {
    let statusIdArr = data.map(this.mapSectionIdAndStatusId);
    this.setState(prevState => {
      return {
        ...prevState,
        statusIdArr
      };
    });
  };

  onTitleSuccess = data => {
    let sections = data.map(this.mapSectionTitles);
    let sectionTitles = sections.map(this.mapSectionIdAndStatusId);
    this.setState(prevState => {
      return { ...prevState, sectionTitles };
    });
  };

  onGetQByIdSuccess = data => {
    this.setState(prevState => {
      return { ...prevState, formData: data };
    });
  };

  mapSectionTitles = section => {
    return {
      id: section.id,
      name: section.title
    };
  };

  axiosFail = error => {
    toast.error(error.message);
  };

  handleSubmit = values => {
    if (!this.state.isEditing) {
      services
        .add(values)
        .then(this.onSubmitSuccess)
        .catch();
    } else {
      services
        .update(values)
        .then(this.onUpdateSuccess)
        .catch(this.axiosFail);
    }
  };

  onSubmitSuccess = () => {
    this.props.history.push("/admin/survey/questions");
  };

  onUpdateSuccess = () => {
    this.props.history.push(`/admin/survey/questions`);
  };

  mapSectionIdAndStatusId = index => (
    <option key={index.id} value={index.id}>
      {index.name}
    </option>
  );

  render() {
    return (
      <div className="col-sm-12">
        <Formik
          enableReinitialize={true}
          validationSchema={ValidationSchema}
          initialValues={this.state.formData}
          onSubmit={this.handleSubmit}
          isInitialValid={this.state.isEditing}
        >
          {props => {
            const {
              values,
              touched,
              errors,
              handleSubmit,
              isValid,
              isSubmitting
            } = props;
            return (
              <div className="card">
                <div className="card-header">
                  <div className="row">
                    <div className="m-auto">
                      <h5>
                        {this.state.isEditing
                          ? "Update Survey question"
                          : "Add a survey question"}
                      </h5>
                    </div>
                  </div>
                </div>
                <div className="card-body">
                  <Form onSubmit={handleSubmit}>
                    <FormGroup>
                      <label
                        htmlFor="questionText"
                        className="col-form-label pt-0"
                      >
                        Question
                      </label>
                      <Field
                        value={values.questionText}
                        name="questionText"
                        id="questionText"
                        placeholder="Enter Question"
                        type="text"
                        autoComplete="off"
                        className={
                          errors.questionText && touched.questionText
                            ? "form-control"
                            : "form-control"
                        }
                      />{" "}
                      {errors.questionText && touched.questionText && (
                        <span className="input-feedback">
                          {errors.questionText}
                        </span>
                      )}
                    </FormGroup>
                    <FormGroup>
                      <label htmlFor="helpText">Help Text</label>
                      <Field
                        value={values.helpText}
                        id="helpText"
                        name="helpText"
                        placeholder="Help Text"
                        type="text"
                        autoComplete="off"
                        className={
                          errors.helpText && touched.helpText
                            ? "form-control"
                            : "form-control"
                        }
                      />{" "}
                      {errors.helpText && touched.helpText && (
                        <span className="input-feedback">
                          {errors.helpText}
                        </span>
                      )}
                    </FormGroup>

                    <FormGroup>
                      <label htmlFor="questionTypeId">Question Type</label>
                      <Field
                        value={values.questionTypeId}
                        name="questionTypeId"
                        id="questionTypeId"
                        as="select"
                        component="select"
                        autoComplete="off"
                        className={
                          errors.questionTypeId && touched.questionTypeId
                            ? "form-control"
                            : "form-control"
                        }
                      >
                        {this.state.questionTypes.length > 0 ? (
                          this.state.questionTypes
                        ) : (
                          <option>No Options</option>
                        )}
                      </Field>
                      {errors.questionTypeId && touched.questionTypeId && (
                        <span className="input-feedback">
                          {errors.questionTypeId}
                        </span>
                      )}
                    </FormGroup>
                    <FormGroup>
                      <label htmlFor="SectionId">Section</label>
                      <Field
                        value={values.sectionId}
                        name="sectionId"
                        id="SectionId"
                        as="select"
                        component="select"
                        autoComplete="off"
                        className={
                          errors.sectionId && touched.sectionId
                            ? "form-control"
                            : "form-control"
                        }
                      >
                        <option key="0" value="0">
                          Select Option
                        </option>
                        {this.state.sectionTitles ? (
                          this.state.sectionTitles
                        ) : (
                          <option key="1">No Options</option>
                        )}
                      </Field>
                      {errors.sectionId && touched.sectionId && (
                        <span className="input-feedback">
                          {errors.sectionId}
                        </span>
                      )}
                    </FormGroup>
                    <FormGroup>
                      <label htmlFor="StatusId">Status</label>
                      <Field
                        value={values.statusId}
                        name="statusId"
                        id="statusId"
                        component="select"
                        as="select"
                        autoComplete="off"
                        className={
                          errors.statusId && touched.statusId
                            ? "form-control"
                            : "form-control"
                        }
                      >
                        <option key="0" value="0">
                          Select Option
                        </option>
                        {this.state.statusIdArr ? (
                          this.state.statusIdArr
                        ) : (
                          <option>No Options</option>
                        )}
                      </Field>
                      {errors.statusId && touched.statusId && (
                        <span className="input-feedback">
                          {errors.statusId}
                        </span>
                      )}
                    </FormGroup>
                    <FormGroup>
                      <label htmlFor="sortOrder">Sort Order</label>
                      <Field
                        value={values.sortOrder}
                        name="sortOrder"
                        id="sortOrder"
                        as="select"
                        component="select"
                        autoComplete="off"
                        className={
                          errors.sortOrder && touched.sortOrder
                            ? "form-control"
                            : "form-control"
                        }
                      >
                        <option key="0" value="0">
                          Select Option
                        </option>
                        <option key="1" value="1">
                          1
                        </option>
                        <option key="2" value="2">
                          2
                        </option>
                        <option key="3" value="3">
                          3
                        </option>
                      </Field>
                      {errors.sortOrder && touched.sortOrder && (
                        <span className="input-feedback">
                          {errors.sortOrder}
                        </span>
                      )}
                    </FormGroup>
                    <FormGroup>
                      <label htmlFor="isRequired">Required Question</label>
                      <Field
                        value={values.isRequired}
                        as="select"
                        name="isRequired"
                        id="isRequired"
                        component="select"
                        autoComplete="off"
                        className={
                          errors.isRequired && touched.isRequired
                            ? "form-control"
                            : "form-control"
                        }
                      >
                        <option key="0" value="0">
                          Select Option
                        </option>
                        <option key="1" value={true}>
                          True
                        </option>
                        <option key="2" value={false}>
                          False
                        </option>
                      </Field>
                      {errors.isRequired && touched.isRequired && (
                        <span className="input-feedback">
                          {errors.isRequired}
                        </span>
                      )}
                    </FormGroup>
                    <FormGroup>
                      <label htmlFor="isMultipleAllowed">
                        Multiple Answers Allowed
                      </label>
                      <Field
                        value={values.isMultipleAllowed}
                        name="isMultipleAllowed"
                        id="isMultipleAllowed"
                        component="select"
                        as="select"
                        autoComplete="off"
                        className={
                          errors.isMultipleAllowed && touched.isMultipleAllowed
                            ? "form-control"
                            : "form-control"
                        }
                      >
                        <option key="0" value="0">
                          Select Option
                        </option>
                        <option key="1" value={true}>
                          True
                        </option>
                        <option key="2" value={false}>
                          False
                        </option>
                      </Field>
                      {errors.isMultipleAllowed &&
                        touched.isMultipleAllowed && (
                          <span className="input-feedback">
                            {errors.isMultipleAllowed}
                          </span>
                        )}
                    </FormGroup>
                    <div className="card-footer">
                      <div className="row">
                        <button
                          className="btn btn-pill btn-primary"
                          type="submit"
                          disabled={!isValid || isSubmitting}
                        >
                          {this.state.isEditing
                            ? "Update Question"
                            : "Submit Question"}
                        </button>
                        <button
                          className="btn btn-pill btn-secondary ml-3"
                          onClick={this.onUpdateSuccess}
                        >
                          Cancel
                        </button>
                      </div>
                    </div>
                  </Form>
                </div>
              </div>
            );
          }}
        </Formik>
      </div>
    );
  }
}
QuestionForm.propTypes = {
  match: PropTypes.shape({
    params: PropTypes.shape({
      id: PropTypes.string
    })
  }),
  history: PropTypes.shape({
    location: PropTypes.shape({
      state: PropTypes.shape({
        isEditing: PropTypes.bool,
        formData: PropTypes.shape({
          questionText: PropTypes.string,
          helpText: PropTypes.string,
          isRequired: PropTypes.bool,
          isMultipleAllowed: PropTypes.bool,
          questionTypeId: PropTypes.number,
          sectionId: PropTypes.number,
          statusId: PropTypes.number,
          sortOrder: PropTypes.number
        })
      })
    }),
    push: PropTypes.func
  })
};
