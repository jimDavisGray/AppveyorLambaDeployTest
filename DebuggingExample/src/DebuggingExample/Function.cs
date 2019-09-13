using System;
using System.Collections.Generic;
using System.Net;
using Amazon.Lambda.APIGatewayEvents;
using Amazon.Lambda.Core;
using Newtonsoft.Json;

// Assembly attribute to enable the Lambda function's JSON input to be converted into a .NET class.
[assembly : LambdaSerializer(
    typeof(Amazon.Lambda.Serialization.Json.JsonSerializer))]

namespace DebuggingExample {
    public class Functions {
        ITimeProcessor processor = new TimeProcessor();

        public APIGatewayProxyResponse Get(
            APIGatewayProxyRequest request, ILambdaContext context) {
            //var result = processor.CurrentTimeUTC();
            DateTime? result = null;

            return CreateResponse(result);
        }

        APIGatewayProxyResponse CreateResponse(DateTime? result) {
            int statusCode = (result != null) ?
                (int) HttpStatusCode.OK :
                (int) HttpStatusCode.InternalServerError;

            string body = (result != null) ?
                //JsonConvert.SerializeObject(result) : string.Empty;
				JsonConvert.SerializeObject(result) : "It is not a time _+_+_+_+";
				

            var response = new APIGatewayProxyResponse {
                StatusCode = statusCode,
                Body = body,
                Headers = new Dictionary<string, string> { { "Content-Type", "application/json" },
                { "Access-Control-Allow-Origin", "*" }
                }
            };

            return response;
        }
    }
}