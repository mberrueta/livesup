defmodule LiveSup.Test.Core.Datasources.DataHelper.JiraProjectStatuses do
  def get() do
    """
    [
      {
         "self":"https://livesup.atlassian.net/rest/api/3/issuetype/10207",
         "id":"10207",
         "name":"Story",
         "subtask":false,
         "statuses":[
            {
               "self":"https://livesup.atlassian.net/rest/api/3/status/10576",
               "description":"",
               "iconUrl":"https://livesup.atlassian.net/",
               "name":"Published",
               "untranslatedName":"Published",
               "id":"10576",
               "statusCategory":{
                  "self":"https://livesup.atlassian.net/rest/api/3/statuscategory/3",
                  "id":3,
                  "key":"done",
                  "colorName":"green",
                  "name":"Done"
               },
               "scope":{
                  "type":"PROJECT",
                  "project":{
                     "id":"10472"
                  }
               }
            },
            {
               "self":"https://livesup.atlassian.net/rest/api/3/status/10575",
               "description":"",
               "iconUrl":"https://livesup.atlassian.net/",
               "name":"Ready for Publish",
               "untranslatedName":"Ready for Publish",
               "id":"10575",
               "statusCategory":{
                  "self":"https://livesup.atlassian.net/rest/api/3/statuscategory/4",
                  "id":4,
                  "key":"indeterminate",
                  "colorName":"yellow",
                  "name":"In Progress"
               },
               "scope":{
                  "type":"PROJECT",
                  "project":{
                     "id":"10472"
                  }
               }
            },
            {
               "self":"https://livesup.atlassian.net/rest/api/3/status/10571",
               "description":"",
               "iconUrl":"https://livesup.atlassian.net/",
               "name":"Review",
               "untranslatedName":"Review",
               "id":"10571",
               "statusCategory":{
                  "self":"https://livesup.atlassian.net/rest/api/3/statuscategory/4",
                  "id":4,
                  "key":"indeterminate",
                  "colorName":"yellow",
                  "name":"In Progress"
               },
               "scope":{
                  "type":"PROJECT",
                  "project":{
                     "id":"10472"
                  }
               }
            },
            {
               "self":"https://livesup.atlassian.net/rest/api/3/status/10539",
               "description":"",
               "iconUrl":"https://livesup.atlassian.net/",
               "name":"Done",
               "untranslatedName":"Done",
               "id":"10539",
               "statusCategory":{
                  "self":"https://livesup.atlassian.net/rest/api/3/statuscategory/3",
                  "id":3,
                  "key":"done",
                  "colorName":"green",
                  "name":"Done"
               },
               "scope":{
                  "type":"PROJECT",
                  "project":{
                     "id":"10472"
                  }
               }
            },
            {
               "self":"https://livesup.atlassian.net/rest/api/3/status/10538",
               "description":"",
               "iconUrl":"https://livesup.atlassian.net/",
               "name":"In Progress",
               "untranslatedName":"In Progress",
               "id":"10538",
               "statusCategory":{
                  "self":"https://livesup.atlassian.net/rest/api/3/statuscategory/4",
                  "id":4,
                  "key":"indeterminate",
                  "colorName":"yellow",
                  "name":"In Progress"
               },
               "scope":{
                  "type":"PROJECT",
                  "project":{
                     "id":"10472"
                  }
               }
            },
            {
               "self":"https://livesup.atlassian.net/rest/api/3/status/10537",
               "description":"",
               "iconUrl":"https://livesup.atlassian.net/",
               "name":"To Do",
               "untranslatedName":"To Do",
               "id":"10537",
               "statusCategory":{
                  "self":"https://livesup.atlassian.net/rest/api/3/statuscategory/2",
                  "id":2,
                  "key":"new",
                  "colorName":"blue-gray",
                  "name":"To Do"
               },
               "scope":{
                  "type":"PROJECT",
                  "project":{
                     "id":"10472"
                  }
               }
            }
         ]
      },
      {
         "self":"https://livesup.atlassian.net/rest/api/3/issuetype/10208",
         "id":"10208",
         "name":"Task",
         "subtask":false,
         "statuses":[
            {
               "self":"https://livesup.atlassian.net/rest/api/3/status/10576",
               "description":"",
               "iconUrl":"https://livesup.atlassian.net/",
               "name":"Published",
               "untranslatedName":"Published",
               "id":"10576",
               "statusCategory":{
                  "self":"https://livesup.atlassian.net/rest/api/3/statuscategory/3",
                  "id":3,
                  "key":"done",
                  "colorName":"green",
                  "name":"Done"
               },
               "scope":{
                  "type":"PROJECT",
                  "project":{
                     "id":"10472"
                  }
               }
            },
            {
               "self":"https://livesup.atlassian.net/rest/api/3/status/10575",
               "description":"",
               "iconUrl":"https://livesup.atlassian.net/",
               "name":"Ready for Publish",
               "untranslatedName":"Ready for Publish",
               "id":"10575",
               "statusCategory":{
                  "self":"https://livesup.atlassian.net/rest/api/3/statuscategory/4",
                  "id":4,
                  "key":"indeterminate",
                  "colorName":"yellow",
                  "name":"In Progress"
               },
               "scope":{
                  "type":"PROJECT",
                  "project":{
                     "id":"10472"
                  }
               }
            },
            {
               "self":"https://livesup.atlassian.net/rest/api/3/status/10571",
               "description":"",
               "iconUrl":"https://livesup.atlassian.net/",
               "name":"Review",
               "untranslatedName":"Review",
               "id":"10571",
               "statusCategory":{
                  "self":"https://livesup.atlassian.net/rest/api/3/statuscategory/4",
                  "id":4,
                  "key":"indeterminate",
                  "colorName":"yellow",
                  "name":"In Progress"
               },
               "scope":{
                  "type":"PROJECT",
                  "project":{
                     "id":"10472"
                  }
               }
            },
            {
               "self":"https://livesup.atlassian.net/rest/api/3/status/10539",
               "description":"",
               "iconUrl":"https://livesup.atlassian.net/",
               "name":"Done",
               "untranslatedName":"Done",
               "id":"10539",
               "statusCategory":{
                  "self":"https://livesup.atlassian.net/rest/api/3/statuscategory/3",
                  "id":3,
                  "key":"done",
                  "colorName":"green",
                  "name":"Done"
               },
               "scope":{
                  "type":"PROJECT",
                  "project":{
                     "id":"10472"
                  }
               }
            }
         ]
      }
    ]
    """
  end
end