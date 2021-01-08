___TERMS_OF_SERVICE___

By creating or modifying this file you agree to Google Tag Manager's Community
Template Gallery Developer Terms of Service available at
https://developers.google.com/tag-manager/gallery-tos (or such other URL as
Google may provide), as modified from time to time.


___INFO___

{
  "type": "TAG",
  "id": "cvt_temp_public_id",
  "version": 1,
  "securityGroups": [],
  "displayName": "Axeptio cookies",
  "brand": {
    "id": "brand_dummy",
    "displayName": ""
  },
  "description": "Template for Axeptio cookie gestion",
  "containerContexts": [
    "WEB"
  ]
}


___TEMPLATE_PARAMETERS___

[
  {
    "type": "TEXT",
    "name": "id",
    "displayName": "Project ID",
    "simpleValueType": true,
    "valueValidators": [
      {
        "type": "REGEX",
        "args": [
          "^[0-9a-fA-F]{24}$"
        ],
        "enablingConditions": [],
        "errorMessage": "Must be a valid ID"
      },
      {
        "type": "NON_EMPTY"
      }
    ],
    "help": "Enter your Project ID. You can find it in the settings menu of your axeptio project."
  },
  {
    "type": "GROUP",
    "name": "advancedSettings",
    "displayName": "Advanced Axeptio Settings",
    "groupStyle": "ZIPPY_CLOSED",
    "subParams": [
      {
        "type": "TEXT",
        "name": "token",
        "displayName": "Token",
        "simpleValueType": true,
        "help": "user token set by the website (if the user is logged in)."
      },
      {
        "type": "CHECKBOX",
        "name": "triggerGTMEvents",
        "checkboxText": "trigger GTM events",
        "simpleValueType": true,
        "defaultValue": true,
        "help": "Flag to tell whether GTM Events should be written in the dataLayer variable or not."
      },
      {
        "type": "TEXT",
        "name": "mountClassName",
        "displayName": "Mount class name",
        "simpleValueType": true,
        "defaultValue": "axeptio_mount",
        "help": "ClassName of the \u003cdiv\u003e tag were Axeptio\u0027s WebsiteOverlay will be mounted."
      },
      {
        "type": "TEXT",
        "name": "apiUrl",
        "displayName": "api URL",
        "simpleValueType": true,
        "defaultValue": "https://api.axept.io/v1",
        "help": "URL on which the widget will send its POST and GET requests \n for querying and storing consent proofs."
      },
      {
        "type": "GROUP",
        "name": "cookiesSettings",
        "displayName": "Cookie settings",
        "groupStyle": "ZIPPY_OPEN",
        "subParams": [
          {
            "type": "TEXT",
            "name": "cookiesVersion",
            "displayName": "Cookies Version",
            "simpleValueType": true,
            "help": "String identifier of the version of Cookie configuration that should be loaded. If this parameter is omitted, then it\u0027s the \"pages\" property in the configuration that gets parsed in case of multiple cookies configurations."
          },
          {
            "type": "TEXT",
            "name": "jsonCookieName",
            "displayName": "json cookie name",
            "simpleValueType": true,
            "defaultValue": "axeptio_cookies",
            "help": "Name of the cookies containing the JSON value of user choices."
          },
          {
            "type": "TEXT",
            "name": "authorizedVendorsCookieName",
            "displayName": "Authorized vendors cookie name",
            "simpleValueType": true,
            "defaultValue": "axeptio_authorized_vendors",
            "help": "Name of the cookies that stores authorized vendors (comma-separated string)."
          },
          {
            "type": "TEXT",
            "name": "cookiesDuration",
            "displayName": "User cookies duration (in days)",
            "simpleValueType": true,
            "defaultValue": 365,
            "valueValidators": [
              {
                "type": "NON_NEGATIVE_NUMBER"
              }
            ],
            "help": "Number of days used the cookie holding user\u0027s choices should be active."
          },
          {
            "type": "TEXT",
            "name": "cookiesDomain",
            "displayName": "User cookies domain",
            "simpleValueType": true,
            "help": "If specified, domain name on which the cookie containing user choices will be available. This allows to request one consent for various subdomains."
          },
          {
            "type": "CHECKBOX",
            "name": "cookiesSecure",
            "checkboxText": "User cookies secure",
            "simpleValueType": true,
            "defaultValue": true,
            "help": "Wether or not the cookie holding choices is HTTPS only"
          }
        ]
      }
    ]
  }
]


___SANDBOXED_JS_FOR_WEB_TEMPLATE___

// Enter your template code here.
const logToConsole = require('logToConsole');
const queryPermission = require('queryPermission');
const encodeUriComponent = require('encodeUriComponent');
const injectScript = require('injectScript');
const setInWindow = require('setInWindow');
const makeNumber = require('makeNumber');

setInWindow('axeptioSettings', 
{clientId: data.id,
token: data.token,
cookiesVersion: data.cookiesVersion,
triggerGTMEvents: data.triggerGTMEvents,
jsonCookieName: data.jsonCookieName,
authorizedVendorsCookieName: data.authorizedVendorsCookieName,
userCookiesDuration: makeNumber(data.cookiesDuration),
userCookiesDomain: data.cookiesDomain,
userCookiesSecure: data.cookiesSecure,
mountClassName: data.mountClassName,
apiUrl: data.apiUrl},
true);



if (queryPermission('inject_script', 'https://static.axept.io/sdk.js')) {
  injectScript('https://static.axept.io/sdk.js', data.gtmOnSuccess, data.gtmOnFailure);
} else {
  data.gtmOnFailure();
}


___WEB_PERMISSIONS___

[
  {
    "instance": {
      "key": {
        "publicId": "logging",
        "versionId": "1"
      },
      "param": [
        {
          "key": "environments",
          "value": {
            "type": 1,
            "string": "debug"
          }
        }
      ]
    },
    "isRequired": true
  },
  {
    "instance": {
      "key": {
        "publicId": "inject_script",
        "versionId": "1"
      },
      "param": [
        {
          "key": "urls",
          "value": {
            "type": 2,
            "listItem": [
              {
                "type": 1,
                "string": "https://static.axept.io/sdk.js"
              }
            ]
          }
        }
      ]
    },
    "clientAnnotations": {
      "isEditedByUser": true
    },
    "isRequired": true
  },
  {
    "instance": {
      "key": {
        "publicId": "access_globals",
        "versionId": "1"
      },
      "param": [
        {
          "key": "keys",
          "value": {
            "type": 2,
            "listItem": [
              {
                "type": 3,
                "mapKey": [
                  {
                    "type": 1,
                    "string": "key"
                  },
                  {
                    "type": 1,
                    "string": "read"
                  },
                  {
                    "type": 1,
                    "string": "write"
                  },
                  {
                    "type": 1,
                    "string": "execute"
                  }
                ],
                "mapValue": [
                  {
                    "type": 1,
                    "string": "axeptioSettings"
                  },
                  {
                    "type": 8,
                    "boolean": true
                  },
                  {
                    "type": 8,
                    "boolean": true
                  },
                  {
                    "type": 8,
                    "boolean": true
                  }
                ]
              },
              {
                "type": 3,
                "mapKey": [
                  {
                    "type": 1,
                    "string": "key"
                  },
                  {
                    "type": 1,
                    "string": "read"
                  },
                  {
                    "type": 1,
                    "string": "write"
                  },
                  {
                    "type": 1,
                    "string": "execute"
                  }
                ],
                "mapValue": [
                  {
                    "type": 1,
                    "string": "axeptioSettings.clientId"
                  },
                  {
                    "type": 8,
                    "boolean": true
                  },
                  {
                    "type": 8,
                    "boolean": true
                  },
                  {
                    "type": 8,
                    "boolean": true
                  }
                ]
              }
            ]
          }
        }
      ]
    },
    "clientAnnotations": {
      "isEditedByUser": true
    },
    "isRequired": true
  }
]


___TESTS___

scenarios: []


___NOTES___

Created on 07/01/2021 à 09:30:40


