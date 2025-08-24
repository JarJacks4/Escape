const axios = require("axios").default;
const qs = require("qs");

/// Start Lucille Self Care AI LLM Group Code

function createLucilleSelfCareAILLMGroup(sessionId, message, getChatHistory) {
  return {
    baseUrl: `https://lucillellm-function-w2jy2mx6tq-uc.a.run.app`,
    headers: { "Content-Type": `application/json` },
  };
}

async function _getSessionCall(context, ffVariables) {
  if (!context.auth) {
    return _unauthenticatedResponse;
  }
  var sessionId = ffVariables["sessionId"];
  var message = ffVariables["message"];
  var getChatHistory = ffVariables["getChatHistory"];
  const lucilleSelfCareAILLMGroup = createLucilleSelfCareAILLMGroup(
    sessionId,
    message,
    getChatHistory,
  );

  var url = `${lucilleSelfCareAILLMGroup.baseUrl}//`;
  var headers = { "Content-Type": `application/json` };
  var params = {};
  var ffApiRequestBody = undefined;

  return makeApiRequest({
    method: "get",
    url,
    headers,
    params,
    returnBody: true,
    isStreamingApi: true,
  });
}

async function _sendMessageCall(context, ffVariables) {
  if (!context.auth) {
    return _unauthenticatedResponse;
  }
  var userMessage = ffVariables["userMessage"];
  var sessionID = ffVariables["sessionID"];
  var sessionId = ffVariables["sessionId"];
  var message = ffVariables["message"];
  var getChatHistory = ffVariables["getChatHistory"];
  const lucilleSelfCareAILLMGroup = createLucilleSelfCareAILLMGroup(
    sessionId,
    message,
    getChatHistory,
  );

  var url = `${lucilleSelfCareAILLMGroup.baseUrl}/chat`;
  var headers = { "Content-Type": `application/json` };
  var params = {};
  var ffApiRequestBody = `
{
  "message": "<userMessage>",
  "session_id": "${escapeStringForJson(sessionID)}"
}`;

  return makeApiRequest({
    method: "post",
    url,
    headers,
    params,
    body: createBody({
      headers,
      params,
      body: ffApiRequestBody,
      bodyType: "JSON",
    }),
    returnBody: true,
    isStreamingApi: true,
  });
}

async function _getChatHistoryCall(context, ffVariables) {
  if (!context.auth) {
    return _unauthenticatedResponse;
  }
  var sessionId = ffVariables["sessionId"];
  var message = ffVariables["message"];
  var getChatHistory = ffVariables["getChatHistory"];
  const lucilleSelfCareAILLMGroup = createLucilleSelfCareAILLMGroup(
    sessionId,
    message,
    getChatHistory,
  );

  var url = `${lucilleSelfCareAILLMGroup.baseUrl}/chat/{session_id}`;
  var headers = { "Content-Type": `application/json` };
  var params = {};
  var ffApiRequestBody = `
{
  "session_id": "string",
  "response": "Chat history retrieved successfully",
  "conversation": ["..."]
}`;

  return makeApiRequest({
    method: "post",
    url,
    headers,
    params,
    body: createBody({
      headers,
      params,
      body: ffApiRequestBody,
      bodyType: "JSON",
    }),
    returnBody: true,
    isStreamingApi: false,
  });
}

/// End Lucille Self Care AI LLM Group Code

/// Helper functions to route to the appropriate API Call.

async function makeApiCall(context, data) {
  var callName = data["callName"] || "";
  var variables = data["variables"] || {};

  const callMap = {
    GetSessionCall: _getSessionCall,
    SendMessageCall: _sendMessageCall,
    GetChatHistoryCall: _getChatHistoryCall,
  };

  if (!(callName in callMap)) {
    return {
      statusCode: 400,
      error: `API Call "${callName}" not defined as private API.`,
    };
  }

  var apiCall = callMap[callName];
  var response = await apiCall(context, variables);
  return response;
}

async function makeApiRequest({
  method,
  url,
  headers,
  params,
  body,
  returnBody,
  isStreamingApi,
}) {
  return axios
    .request({
      method: method,
      url: url,
      headers: headers,
      params: params,
      responseType: isStreamingApi ? "stream" : "json",
      ...(body && { data: body }),
    })
    .then((response) => {
      return {
        statusCode: response.status,
        headers: response.headers,
        ...(returnBody && { body: response.data }),
        isStreamingApi: isStreamingApi,
      };
    })
    .catch(function (error) {
      return {
        statusCode: error.response.status,
        headers: error.response.headers,
        ...(returnBody && { body: error.response.data }),
        error: error.message,
      };
    });
}

const _unauthenticatedResponse = {
  statusCode: 401,
  headers: {},
  error: "API call requires authentication",
};

function createBody({ headers, params, body, bodyType }) {
  switch (bodyType) {
    case "JSON":
      headers["Content-Type"] = "application/json";
      return body;
    case "TEXT":
      headers["Content-Type"] = "text/plain";
      return body;
    case "X_WWW_FORM_URL_ENCODED":
      headers["Content-Type"] = "application/x-www-form-urlencoded";
      return qs.stringify(params);
  }
}
function escapeStringForJson(val) {
  if (typeof val !== "string") {
    return val;
  }
  return val
    .replace(/[\\]/g, "\\\\")
    .replace(/["]/g, '\\"')
    .replace(/[\n]/g, "\\n")
    .replace(/[\t]/g, "\\t");
}

module.exports = { makeApiCall };
