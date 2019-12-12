import axios from "axios";
import {
  onGlobalError,
  onGlobalSuccess,
  API_HOST_PREFIX
} from "./serviceHelpers";

const getPaginate = pageIndex => {
  const config = {
    method: "GET",
    withCredentials: true,
    crossdomain: true,
    url: `${API_HOST_PREFIX}/api/surveys/questions?pageIndex=${pageIndex}&pageSize=8`
  };

  return axios(config)
    .then(onGlobalSuccess)
    .catch(onGlobalError);
};

const getById = id => {
  const config = {
    method: "GET",
    withCredentials: true,
    crossdomain: true,
    url: `${API_HOST_PREFIX}/api/surveys/questions/${id}`
  };

  return axios(config)
    .then(onGlobalSuccess)
    .catch(onGlobalError);
};

const getQuestionOptionDetails = () => {
  const config = {
    method: "GET",
    withCredentials: true,
    crossdomain: true,
    url: `${API_HOST_PREFIX}/api/surveys/questions/details`
  };

  return axios(config)
    .then(onGlobalSuccess)
    .catch(onGlobalError);
};

const add = data => {
  const config = {
    method: "POST",
    withCredentials: true,
    crossdomain: true,
    data: data,
    url: `${API_HOST_PREFIX}/api/surveys/questions`
  };

  return axios(config)
    .then(onGlobalSuccess)
    .catch(onGlobalError);
};

const update = data => {
  const config = {
    method: "PUT",
    withCredentials: true,
    crossdomain: true,
    data: data,
    url: `${API_HOST_PREFIX}/api/surveys/questions/${data.id}`
  };

  return axios(config)
    .then(onGlobalSuccess)
    .catch(onGlobalError);
};

export { getPaginate, add, getById, update, getQuestionOptionDetails };
