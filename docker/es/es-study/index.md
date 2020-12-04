## 新建索引
PUT movies
{
  "settings" : {
    "number_of_shards" : "1",
    "number_of_replicas" : "0"
  },
  "mappings":{
    "_source": {
        "excludes":["_id"]
    }
  }
}

## 查询索引总记录数
GET movies/_count


## https://n3xtchen.github.io/n3xtchen/elasticsearch/2017/07/05/elasticsearch-23-useful-query-example

## 创建索引
PUT /bookdb_index 
{
  "settings": {
    "number_of_shards": 1
  }
}

## 批量上传文档
POST /bookdb_index/_bulk
    { "index": { "_id": 1 }}
    { "title": "Elasticsearch: The Definitive Guide", "authors": ["clinton gormley", "zachary tong"], "summary" : "A distibuted real-time search and analytics engine", "publish_date" : "2015-02-07", "num_reviews": 20, "publisher": "oreilly" }
    { "index": { "_id": 2 }}
    { "title": "Taming Text: How to Find, Organize, and Manipulate It", "authors": ["grant ingersoll", "thomas morton", "drew farris"], "summary" : "organize text using approaches such as full-text search, proper name recognition, clustering, tagging, information extraction, and summarization", "publish_date" : "2013-01-24", "num_reviews": 12, "publisher": "manning" }
    { "index": { "_id": 3 }}
    { "title": "Elasticsearch in Action", "authors": ["radu gheorge", "matthew lee hinman", "roy russo"], "summary" : "build scalable search applications using Elasticsearch without having to do complex low-level programming or understand advanced data science algorithms", "publish_date" : "2015-12-03", "num_reviews": 18, "publisher": "manning" }
    { "index": { "_id": 4 }}
    { "title": "Solr in Action", "authors": ["trey grainger", "timothy potter"], "summary" : "Comprehensive guide to implementing a scalable search engine using Apache Solr", "publish_date" : "2014-04-05", "num_reviews": 23, "publisher": "manning" }

## 1. 基本的匹配（Query）查询
GET /bookdb_index/_search?q=guide

POST /bookdb_index/_search
{
  "query": {
    "multi_match": {
      "query": "guide",
      "fields": ["_all"]
    }
  }
}

GET /bookdb_index/_search?q=title:in action

## 2. 多字段（Multi-filed）查询
POST /bookdb_index/_search
{
  "query": {
    "match": {
      "title": "in action"
    }
  },
  "size": 2,
  "from": 0,
  "_source": ["title","summary","publish_date"],
  "highlight": {
    "fields": {
      "title": {}
    }
  }
}

POST /bookdb_index/_search
{
  "query": {
    "multi_match": {
      "query": "elasticsearch guide",
      "fields": ["title", "summary"]
    }
  }
}

## 3. Boosting
POST /bookdb_index/_search
{
  "query": {
    "multi_match": {
      "query": "elasticsearch guide",
      "fields": ["title", "summary^3"]
    }
  },
  "_source": ["title","summary","publish_date"]
}

## 4. Bool 查询
POST /bookdb_index/_search
{
    "query": {
        "bool": {
            "must": {
                "bool" : { "should": [
                      { "match": { "title": "Elasticsearch" }},
                      { "match": { "title": "Solr" }} ] }
            },
            "must_not": { "match": {"authors": "radu gheorge" }}
        }
    }
}

## 5. 模糊（Fuzzy）查询
POST /bookdb_index/_search
{
  "query": {
    "multi_match": {
      "query": "comprihensiv guide",
      "fields": ["title", "summary"],
      "fuzziness": "AUTO"
    }
  },
  "_source": ["title", "summary", "publish_date"],
  "size": 1
}

## 6. 通配符（Wildcard）查询
POST /bookdb_index/_search
{
  "query": {
    "wildcard": {
      "authors": {
        "value": "t*"
      }
    }
  },
  "_source": ["title", "authors"],
  "highlight": {
    "fields": {
      "authors": {}
    }
  }
}

## 7. 正则（Regexp）查询
POST /bookdb_index/_search
{
  "query": {
    "regexp": {
      "authors": "t[a-z]*y"
    }
  },
  "_source": [ "title", "authors"],
  "highlight": {
    "fields": {
      "authors": {}
    }
  }
}

## 8. 短语匹配(Match Phrase)查询
POST /bookdb_index/_search
{
  "query": {
    "multi_match": {
      "query": "search engine",
      "fields": ["title", "summary"],
      "type": "phrase",
      "slop": 3
    }
  },
  "_source": ["title", "summary", "publish_date"]
}

## 9. 短语前缀（Match Phrase Prefix）查询
POST /bookdb_index/_search
{
  "query": {
    "match_phrase_prefix": {
      "summary": {
        "query": "search en",
        "slop": 3,
        "max_expansions": 10
      }
    }
  },
  "_source": ["title", "summary", "publish_date"]
}

## 10. 查询字符串（Query String）
POST /bookdb_index/_search
{
  "query": {
    "query_string": {
      "query": "(saerch~1 algorithm~1) AND (grant ingersoll)  OR (tom morton)",
       "fields": ["_all", "summary^2"]
    }
  },
  "_source": ["title", "summary", "authors"],
  "highlight": {
    "fields": {
      "summary": {}
    }
  }
}

## 11. 简单查询字符串（Simple Query String）
POST /bookdb_index/_search
{
  "query": {
    "simple_query_string": {
      "query": "(saerch~1 algorithm~1) + (grant ingersoll)  | (tom morton)",
      "fields": ["_all", "summary^2"]
    }
  },  
  "_source": ["title", "summary", "authors"],
  "highlight": {
    "fields": {
      "summary": {}
    }
  }
}

## 12. 词条（Term）/多词条（Terms）查询
POST /bookdb_index/_search
{
  "query": {
    "term": {
      "publisher": {
        "value": "manning"
      }
    }
  },
  "_source": ["title","publish_date","publisher"]
}

### 多词条版本
POST /bookdb_index/_search
{
  "query": {
    "terms": {
      "publisher": ["oreilly","packt"]
    }
  },
  "_source": ["title","publish_date","publisher"]
}

## 13. 词条（Term）查询 - 排序（Sorted）
POST /bookdb_index/_search
{
  "query": {
    "term": {
      "publisher": "manning"
    }
  },
  "_source": [
    "title",
    "publish_date",
    "publisher"
  ],
  "sort": [
    {
      "publish_date": {
        "order": "desc"
      }
    }
  ]
}

## 14. 范围查询
POST /bookdb_index/_search
{
  "query": {
    "range": {
      "publish_date": {
        "gte": "2015-01-01",
        "lte": "2015-12-31"
      }
    }
  },
  "_source": [
    "title",
    "publish_date",
    "publisher"
  ]
}

## 15. 过滤(Filtered)查询
POST /bookdb_index/_search
{
    "query": {
       "bool": {
         "must": {
           "multi_match": {
              "query": "elasticsearch",
              "fields": ["title","summary"]
           }
         },
         "filter": {
           "range": {
             "num_reviews": {
               "gte": 20
             }
           }
         }
       }
    },
    "_source" : ["title","summary","publisher", "num_reviews"]
}

## 多重过滤（Multiple Filters）

POST /bookdb_index/_search
{
  "query": {
    "bool": {
      "must": {
        "multi_match": {
          "query": "elasticsearch",
          "fields": [
            "title",
            "summary"
          ]
        }
      },
      "filter": {
        "bool": {
          "must": {
            "range": {
              "num_reviews": {
                "gte": 20
              }
            }
          },
          "must_not": {
            "range": {
              "publish_date": {
                "lte": "2014-12-31"
              }
            }
          },
          "should": {
            "term": {
              "publisher": "oreilly"
            }
          }
        }
      }
    }
  },
  "_source": [
    "title",
    "summary",
    "publisher",
    "num_reviews"
  ]
}