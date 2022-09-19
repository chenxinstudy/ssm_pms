/*
 Navicat Premium Data Transfer

 Source Server         : test
 Source Server Type    : MySQL
 Source Server Version : 80026
 Source Host           : localhost:3306
 Source Schema         : blog

 Target Server Type    : MySQL
 Target Server Version : 80026
 File Encoding         : 65001

 Date: 25/12/2021 17:55:04
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for t_article
-- ----------------------------
DROP TABLE IF EXISTS `t_article`;
CREATE TABLE `t_article`  (
  `aid` int NOT NULL AUTO_INCREMENT COMMENT '主键',
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '文章标题',
  `digest` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '摘要',
  `content` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '文章内容',
  `cid` int NULL DEFAULT NULL COMMENT '所属标签分类',
  `visit_count` int NULL DEFAULT NULL COMMENT '访问量',
  `create_time` char(19) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '发布时间',
  `update_time` char(19) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '更新时间',
  `is_hot` int NULL DEFAULT NULL COMMENT '是否热门 0：不热门 1：热门',
  `logo` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '文章logo',
  `uid` int NULL DEFAULT NULL COMMENT '发布者',
  `isOpen` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否公开 0:不公开 1:公开',
  `thumbsUp` bigint NULL DEFAULT NULL COMMENT '点赞数',
  `tagNames` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '文章标签',
  `isCommented` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否被评论 0 否 1 是',
  PRIMARY KEY (`aid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 96 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of t_article
-- ----------------------------
INSERT INTO `t_article` VALUES (59, '学习', '这篇文章是为了介绍自己自学用过的Java视频资料。', '使用Editor.md保存的html代码 前端页面如何显示\r\n1.引入css:grimacing: :kissing_heart:\r\n```css\r\n<link rel=\"stylesheet\" href=\"/editor.md/css/editormd.css\" />\r\n```\r\n2.引入js\r\n```javascript\r\n<script  src=\"/js/jquery-1.11.3.min.js\"></script>\r\n<script  src=\"/editor.md/editormd.js\"></script>\r\n<script  src=\"/editor.md/lib/marked.min.js\"></script>\r\n<script  src=\"/editor.md/lib/prettify.min.js\"></script>\r\n```\r\n3.模板引擎渲染html,取出html代码\r\n```css\r\n<div id=\"content\">\r\n  {{ $article->editor-html-code }}   // laravel blade\r\n</div>\r\n```\r\n122223', 3, 10, '2020-09-20', '2021-01-25 00:07:29', 0, 'http://localhost:8080/blog\\upload\\2021-01-25\\admin\\1611504449851', 1, '1', 999, 'null', NULL);
INSERT INTO `t_article` VALUES (64, 'Java学习路线推荐1', '在网上看到有很多的前端学习路线图，但大部分的前端学习路线图是很零碎的', '```\r\npackage com.bjpowernode.blog.back.controller;\r\n\r\nimport com.bjpowernode.blog.back.bean.Article;\r\nimport com.bjpowernode.blog.back.bean.Category;\r\nimport com.bjpowernode.blog.back.bean.Tag;\r\nimport com.bjpowernode.blog.back.bean.User;\r\nimport com.bjpowernode.blog.back.service.ArticleService;\r\nimport com.bjpowernode.blog.base.bean.PaginationVo;\r\nimport com.bjpowernode.blog.base.bean.ResultVo;\r\nimport com.bjpowernode.blog.base.constants.BlogConstants;\r\nimport com.bjpowernode.blog.base.exception.BlogException;\r\nimport com.bjpowernode.blog.base.util.FileUploadUtil;\r\nimport com.github.pagehelper.PageHelper;\r\nimport com.github.pagehelper.PageInfo;\r\nimport org.springframework.beans.factory.annotation.Autowired;\r\nimport org.springframework.stereotype.Controller;\r\nimport org.springframework.ui.Model;\r\nimport org.springframework.web.bind.annotation.RequestMapping;\r\nimport org.springframework.web.bind.annotation.RequestParam;\r\nimport org.springframework.web.bind.annotation.ResponseBody;\r\nimport org.springframework.web.multipart.MultipartFile;\r\n\r\nimport javax.servlet.http.HttpServletRequest;\r\nimport javax.servlet.http.HttpSession;\r\nimport java.util.Arrays;\r\nimport java.util.List;\r\nimport java.util.Map;\r\n\r\n/**\r\n * Company :  北京动力节点\r\n * Author :   Andy\r\n * Date : 2021/1/12\r\n * Description :\r\n */\r\n@Controller\r\npublic class ArticleController {\r\n\r\n    @Autowired\r\n    private ArticleService articleService;\r\n\r\n    //增加点赞数\r\n    @RequestMapping(\"/article/addThumbsUp\")\r\n    @ResponseBody\r\n    public ResultVo addThumbsUp(String aid){\r\n        ResultVo resultVo = new ResultVo();\r\n        try {\r\n            String thumbsUp = articleService.addThumbsUp(aid);\r\n            resultVo.setOk(true);\r\n            resultVo.setMess(thumbsUp);\r\n        }catch (BlogException e){\r\n            resultVo.setOk(true);\r\n            e.printStackTrace();\r\n        }\r\n        return resultVo;\r\n    }\r\n\r\n    //前提查询文章\r\n    @RequestMapping(\"/article/articleList\")\r\n    public String articleList(Model model){\r\n        //查询最新发布的前6篇文章\r\n        List<Article> articles = articleService.queryTop6();\r\n        model.addAttribute(\"articles\",articles);\r\n        return \"../../view/article/article\";\r\n    }\r\n    //根据主键查询文章信息\r\n    @RequestMapping(\"/article/queryById\")\r\n    public String queryById(String aid, Model model){\r\n        Article article = articleService.queryById(aid);\r\n        model.addAttribute(\"article\",article);\r\n        return \"updateArticle\";\r\n    }\r\n\r\n    //根据主键查询文章信息,跳转到前台文章详情页\r\n    @RequestMapping(\"/article/queryByIdToDetail\")\r\n    public String queryByIdToDetail(String aid, Model model){\r\n        Article article = articleService.queryById(aid);\r\n        model.addAttribute(\"article\",article);\r\n        return \"../../view/article/articleDetail\";\r\n    }\r\n\r\n    //异步更新文章是否公开\r\n    @RequestMapping(\"/article/updateIsOpen\")\r\n    @ResponseBody\r\n    public ResultVo updateIsOpen(String isOpen,String aid){\r\n        ResultVo resultVo = new ResultVo();\r\n        try {\r\n            articleService.updateIsOpen(isOpen,aid);\r\n            resultVo.setOk(true);\r\n            if(\"1\".equals(isOpen)){\r\n                //公开\r\n                resultVo.setMess(\"已将文章设为公开\");\r\n            }else{\r\n                //私密\r\n                resultVo.setMess(\"已将文章设为私密\");\r\n            }\r\n\r\n        } catch (BlogException e) {\r\n            e.printStackTrace();\r\n            resultVo.setOk(false);\r\n            if(\"1\".equals(isOpen)){\r\n                //公开\r\n                resultVo.setMess(\"已将文章设为公开失败\");\r\n            }else{\r\n                //私密\r\n                resultVo.setMess(\"已将文章设为私密失败\");\r\n            }\r\n        }\r\n        return resultVo;\r\n    }\r\n\r\n    //选中栏目查询栏目下所有的标签\r\n    @RequestMapping(\"/article/queryByCategory\")\r\n    @ResponseBody\r\n    public List<Tag> queryByCategory(String cid,HttpSession session){\r\n        //从ServletContext中获取栏目信息\r\n        List<Category> categories =\r\n                (List<Category>) session.getServletContext().getAttribute(\"categories\");\r\n        List<Tag> tags = null;\r\n        for (Category category : categories) {\r\n            if(cid.equals(category.getCid())){\r\n                //获取栏目下对应的标签\r\n               tags = category.getTags();\r\n            }\r\n        }\r\n        return tags;\r\n    }\r\n\r\n    //文章列表和条件查询列表\r\n    @RequestMapping(\"/article/list\")\r\n    @ResponseBody\r\n    public PaginationVo list(@RequestParam(defaultValue = \"1\",required = false) int page,\r\n                             @RequestParam(defaultValue = \"2\",required = false) int pageSize,\r\n                             String title, HttpSession session){\r\n        //开启分页功能 limit a,b\r\n        PageHelper.startPage(page, pageSize);\r\n        //获取当前登录用户信息\r\n        User user = (User) session.getAttribute(BlogConstants.LOGIN_USER);\r\n        //查询所有文章信息\r\n        List<Article> articles = articleService.list(user.getUid(),title);\r\n        PageInfo<Article> pageInfo = new PageInfo<>(articles);\r\n        //把前台分页插件需要的数据都封装到paginationVo\r\n        PaginationVo<Article> paginationVo = new PaginationVo<>(pageInfo);\r\n        return paginationVo;\r\n    }\r\n\r\n    //发布和修改文章\r\n    @RequestMapping(\"/article/saveOrUpdateArticle\")\r\n    public String saveOrUpdateArticle(Article article, HttpServletRequest request,\r\n                                        MultipartFile img,String[] tid,String aid){\r\n        //获取文章LOGO图片\r\n        Map<String,Object> map = FileUploadUtil.fileUpload(img,request);\r\n        String logo = (String) map.get(\"url\");\r\n        article.setLogo(logo);\r\n\r\n        //文章标签\r\n        article.setTagNames(Arrays.toString(tid));\r\n\r\n        //将登录用户主键设置到外键中\r\n        User user =\r\n                (User) request.getSession().getAttribute(BlogConstants.LOGIN_USER);\r\n        article.setUid(user.getUid());\r\n        ResultVo resultVo = new ResultVo();\r\n        try{\r\n            articleService.saveOrUpdateArticle(article,aid);\r\n        }catch (BlogException e){\r\n            System.out.println(\"添加文章失败\");\r\n        }\r\n\r\n        return \"article\";\r\n    }\r\n\r\n    //异步删除文章\r\n    @RequestMapping(\"/article/deleteArticle\")\r\n    @ResponseBody\r\n    public ResultVo deleteArticle(String aid){\r\n        ResultVo resultVo = new ResultVo();\r\n        try {\r\n            articleService.deleteArticle(aid);\r\n            resultVo.setOk(true);\r\n            resultVo.setMess(\"删除文章成功\");\r\n        } catch (BlogException e) {\r\n            e.printStackTrace();\r\n            resultVo.setOk(false);\r\n        }\r\n        return resultVo;\r\n    }\r\n}\r\n\r\n```\r\n![](http://localhost:8080/blog\\upload\\2021-01-13\\admin\\1610504718461a1.jpg)', 4, 10, '2021-01-13', '2021-01-25 00:39:18', 0, 'http://localhost:8080/blog\\upload\\2021-01-25\\admin\\1611506358721', 1, '1', 3, 'null', NULL);
INSERT INTO `t_article` VALUES (65, 'Java学习路线推荐2', '这篇文章是为了介绍自己自学害了', '```\r\npackage com.bjpowernode.blog.back.controller;\r\n\r\nimport com.bjpowernode.blog.back.bean.Article;\r\nimport com.bjpowernode.blog.back.bean.User;\r\nimport com.bjpowernode.blog.back.service.ArticleService;\r\nimport com.bjpowernode.blog.base.bean.ResultVo;\r\nimport com.bjpowernode.blog.base.constants.BlogConstants;\r\nimport com.bjpowernode.blog.base.exception.BlogException;\r\nimport com.bjpowernode.blog.base.util.FileUploadUtil;\r\nimport org.springframework.beans.factory.annotation.Autowired;\r\nimport org.springframework.stereotype.Controller;\r\nimport org.springframework.web.bind.annotation.RequestMapping;\r\nimport org.springframework.web.bind.annotation.RestController;\r\nimport org.springframework.web.multipart.MultipartFile;\r\n\r\nimport javax.servlet.http.HttpServletRequest;\r\nimport java.util.Map;\r\n\r\n/**\r\n * Company :  北京动力节点\r\n * Author :   Andy\r\n * Date : 2021/1/12\r\n * Description :\r\n */\r\n@Controller\r\npublic class ArticleController {\r\n\r\n    @Autowired\r\n    private ArticleService articleService;\r\n\r\n    //发布和修改文章\r\n    @RequestMapping(\"/article/saveOrUpdateArticle\")\r\n    public String saveOrUpdateArticle(Article article, HttpServletRequest request,\r\n                                        MultipartFile img){\r\n        //获取文章LOGO图片\r\n        Map<String,Object> map = FileUploadUtil.fileUpload(img,request);\r\n        String logo = (String) map.get(\"url\");\r\n        article.setLogo(logo);\r\n\r\n        //将登录用户主键设置到外键中\r\n        User user =\r\n                (User) request.getSession().getAttribute(BlogConstants.LOGIN_USER);\r\n        article.setUid(user.getUid());\r\n        ResultVo resultVo = new ResultVo();\r\n        try{\r\n            articleService.saveOrUpdateArticle(article);\r\n        }catch (BlogException e){\r\n            System.out.println(\"添加文章失败\");\r\n        }\r\n\r\n        return \"article\";\r\n    }\r\n}\r\n\r\n```\r\n![](http://localhost:8080/blog\\upload\\2021-01-13\\admin\\1610504718461a1.jpg)\r\n\r\n                \r\n                ', 4, 200, '2021-03-13', '2021-01-25 00:16:49', 0, 'http://localhost:8080/blog\\upload\\2021-01-13\\admin\\1610539885667a1.jpg', 1, '0', 6, '自驾游, 飞机旅游', NULL);
INSERT INTO `t_article` VALUES (66, '去云南旅游', NULL, '> 去云南旅游\r\n\r\n01月或春节打算去三亚玩！请问三亚有哪些比较好玩景点？听说三亚的海景房超赞，还想体验一次深海潜水和游艇出海，但消费比较高又很抢手，怎么玩省心省力还省钱？有去过的朋友可以推荐一下游玩路线和景点吗?:blush:\r\n![](http://localhost:8080/blog\\upload\\2021-01-13\\admin\\1610519083028a1.jpg)\r\n                ', 2, 30, '2021-01-14', NULL, 0, 'http://localhost:8080/blog\\upload\\2021-01-13\\admin\\16105197886023.png', 1, '0', 5, '自驾游, 飞机旅游', NULL);
INSERT INTO `t_article` VALUES (67, '赛艇', '赛艇运', '\r\n                ', 1, 1, '2021-01-24', NULL, 0, 'http://localhost:8080/blog\\upload\\2021-01-24\\admin\\1611422013336伙伴.jpg', 1, '1', 0, '自驾游, 飞机旅游', NULL);
INSERT INTO `t_article` VALUES (68, '关于Java编程', '这篇文章是为了介绍自己自学用过的Java视频资料。本套整合教分视', ' ```java\r\npackage com.bjpowernode.blog.back.controller;\r\n\r\nimport com.bjpowernode.blog.back.bean.Article;\r\nimport com.bjpowernode.blog.back.bean.Category;\r\nimport com.bjpowernode.blog.back.bean.Tag;\r\nimport com.bjpowernode.blog.back.bean.User;\r\nimport com.bjpowernode.blog.back.service.ArticleService;\r\nimport com.bjpowernode.blog.base.bean.PaginationVo;\r\nimport com.bjpowernode.blog.base.bean.ResultVo;\r\nimport com.bjpowernode.blog.base.constants.BlogConstants;\r\nimport com.bjpowernode.blog.base.exception.BlogException;\r\nimport com.bjpowernode.blog.base.util.FileUploadUtil;\r\nimport com.github.pagehelper.PageHelper;\r\nimport com.github.pagehelper.PageInfo;\r\nimport org.springframework.beans.factory.annotation.Autowired;\r\nimport org.springframework.stereotype.Controller;\r\nimport org.springframework.ui.Model;\r\nimport org.springframework.web.bind.annotation.RequestMapping;\r\nimport org.springframework.web.bind.annotation.RequestParam;\r\nimport org.springframework.web.bind.annotation.ResponseBody;\r\nimport org.springframework.web.multipart.MultipartFile;\r\n\r\nimport javax.servlet.http.HttpServletRequest;\r\nimport javax.servlet.http.HttpSession;\r\nimport java.util.Arrays;\r\nimport java.util.List;\r\nimport java.util.Map;\r\n\r\n/**\r\n * Company :  北京动力节点\r\n * Author :   Andy\r\n * Date : 2021/1/12\r\n * Description :\r\n */\r\n@Controller\r\npublic class ArticleController {\r\n\r\n    @Autowired\r\n    private ArticleService articleService;\r\n\r\n    //增加点赞数\r\n    @RequestMapping(\"/article/addThumbsUp\")\r\n    @ResponseBody\r\n    public ResultVo addThumbsUp(String aid){\r\n        ResultVo resultVo = new ResultVo();\r\n        try {\r\n            String thumbsUp = articleService.addThumbsUp(aid);\r\n            resultVo.setOk(true);\r\n            resultVo.setMess(thumbsUp);\r\n        }catch (BlogException e){\r\n            resultVo.setOk(true);\r\n            e.printStackTrace();\r\n        }\r\n        return resultVo;\r\n    }\r\n\r\n    //前提查询文章\r\n    @RequestMapping(\"/article/articleList\")\r\n    public String articleList(Model model){\r\n        //查询最新发布的前6篇文章\r\n        List<Article> articles = articleService.queryTop6();\r\n        model.addAttribute(\"articles\",articles);\r\n        return \"../../view/article/article\";\r\n    }\r\n    //根据主键查询文章信息\r\n    @RequestMapping(\"/article/queryById\")\r\n    public String queryById(String aid, Model model){\r\n        Article article = articleService.queryById(aid);\r\n        model.addAttribute(\"article\",article);\r\n        return \"updateArticle\";\r\n    }\r\n\r\n    //根据主键查询文章信息,跳转到前台文章详情页\r\n    @RequestMapping(\"/article/queryByIdToDetail\")\r\n    public String queryByIdToDetail(String aid, Model model){\r\n        Article article = articleService.queryById(aid);\r\n        model.addAttribute(\"article\",article);\r\n        return \"../../view/article/articleDetail\";\r\n    }\r\n\r\n    //异步更新文章是否公开\r\n    @RequestMapping(\"/article/updateIsOpen\")\r\n    @ResponseBody\r\n    public ResultVo updateIsOpen(String isOpen,String aid){\r\n        ResultVo resultVo = new ResultVo();\r\n        try {\r\n            articleService.updateIsOpen(isOpen,aid);\r\n            resultVo.setOk(true);\r\n            if(\"1\".equals(isOpen)){\r\n                //公开\r\n                resultVo.setMess(\"已将文章设为公开\");\r\n            }else{\r\n                //私密\r\n                resultVo.setMess(\"已将文章设为私密\");\r\n            }\r\n\r\n        } catch (BlogException e) {\r\n            e.printStackTrace();\r\n            resultVo.setOk(false);\r\n            if(\"1\".equals(isOpen)){\r\n                //公开\r\n                resultVo.setMess(\"已将文章设为公开失败\");\r\n            }else{\r\n                //私密\r\n                resultVo.setMess(\"已将文章设为私密失败\");\r\n            }\r\n        }\r\n        return resultVo;\r\n    }\r\n\r\n    //选中栏目查询栏目下所有的标签\r\n    @RequestMapping(\"/article/queryByCategory\")\r\n    @ResponseBody\r\n    public List<Tag> queryByCategory(String cid,HttpSession session){\r\n        //从ServletContext中获取栏目信息\r\n        List<Category> categories =\r\n                (List<Category>) session.getServletContext().getAttribute(\"categories\");\r\n        List<Tag> tags = null;\r\n        for (Category category : categories) {\r\n            if(cid.equals(category.getCid())){\r\n                //获取栏目下对应的标签\r\n               tags = category.getTags();\r\n            }\r\n        }\r\n        return tags;\r\n    }\r\n\r\n    //文章列表和条件查询列表\r\n    @RequestMapping(\"/article/list\")\r\n    @ResponseBody\r\n    public PaginationVo list(@RequestParam(defaultValue = \"1\",required = false) int page,\r\n                             @RequestParam(defaultValue = \"2\",required = false) int pageSize,\r\n                             String title, HttpSession session){\r\n        //开启分页功能 limit a,b\r\n        PageHelper.startPage(page, pageSize);\r\n        //获取当前登录用户信息\r\n        User user = (User) session.getAttribute(BlogConstants.LOGIN_USER);\r\n        //查询所有文章信息\r\n        List<Article> articles = articleService.list(user.getUid(),title);\r\n        PageInfo<Article> pageInfo = new PageInfo<>(articles);\r\n        //把前台分页插件需要的数据都封装到paginationVo\r\n        PaginationVo<Article> paginationVo = new PaginationVo<>(pageInfo);\r\n        return paginationVo;\r\n    }\r\n\r\n    //发布和修改文章\r\n    @RequestMapping(\"/article/saveOrUpdateArticle\")\r\n    public String saveOrUpdateArticle(Article article, HttpServletRequest request,\r\n                                        MultipartFile img,String[] tid,String aid){\r\n        //获取文章LOGO图片\r\n        Map<String,Object> map = FileUploadUtil.fileUpload(img,request);\r\n        String logo = (String) map.get(\"url\");\r\n        article.setLogo(logo);\r\n\r\n        //文章标签\r\n        article.setTagNames(Arrays.toString(tid));\r\n\r\n        //将登录用户主键设置到外键中\r\n        User user =\r\n                (User) request.getSession().getAttribute(BlogConstants.LOGIN_USER);\r\n        article.setUid(user.getUid());\r\n        ResultVo resultVo = new ResultVo();\r\n        try{\r\n            articleService.saveOrUpdateArticle(article,aid);\r\n        }catch (BlogException e){\r\n            System.out.println(\"添加文章失败\");\r\n        }\r\n\r\n        return \"article\";\r\n    }\r\n\r\n    //异步删除文章\r\n    @RequestMapping(\"/article/deleteArticle\")\r\n    @ResponseBody\r\n    public ResultVo deleteArticle(String aid){\r\n        ResultVo resultVo = new ResultVo();\r\n        try {\r\n            articleService.deleteArticle(aid);\r\n            resultVo.setOk(true);\r\n            resultVo.setMess(\"删除文章成功\");\r\n        } catch (BlogException e) {\r\n            e.printStackTrace();\r\n            resultVo.setOk(false);\r\n        }\r\n        return resultVo;\r\n    }\r\n}\r\n\r\n```\r\n![](http://localhost:8080/blog\\upload\\2021-01-25\\admin\\16115059327483.png)\r\n|   |   |\r\n| ------------ | ------------ |\r\n|   |   |\r\n|   |   |\r\n\r\n                ', 4, 0, '2021-01-25', '2021-01-25 00:36:27', 0, 'http://localhost:8080/blog\\upload\\2021-01-25\\admin\\1611506187244', 1, '1', 0, 'null', NULL);
INSERT INTO `t_article` VALUES (90, '运动', '运动好', '![](http://localhost/upload/admin\\2021-12-20\\1640012346229bus2.jpg)\n', NULL, 0, '2021-12-20 22:59:18', NULL, 0, '', 1, '0', 0, '户外运动', '0');
INSERT INTO `t_article` VALUES (91, '', '', '\n                ', NULL, 0, '2021-12-20 23:00:19', NULL, 0, '', 1, '1', 0, '', '0');
INSERT INTO `t_article` VALUES (92, '1', '1', '\n                1', NULL, 0, '2021-12-20 23:02:00', NULL, 0, '', 1, '0', 0, '户外运动', '0');
INSERT INTO `t_article` VALUES (93, '', '', '\n                ', NULL, 0, '2021-12-20 23:02:06', NULL, 0, '', 1, '1', 0, '', '0');
INSERT INTO `t_article` VALUES (94, '请求', '1', '\n                1', NULL, 0, '2021-12-20 23:03:06', NULL, 0, '', 1, '0', 0, '户外运动', '0');
INSERT INTO `t_article` VALUES (95, '1', '1', '1', NULL, 0, '2021-12-20 23:03:38', NULL, 0, '', 1, '0', 0, '户外运动', '0');
INSERT INTO `t_article` VALUES (96, '1', '1', '![](http://localhost/blog/upload/2021-12-20\\admin\\1640013324789bus2.jpg)\n                ', NULL, 0, '2021-12-20 23:15:31', NULL, 0, '', 1, '1', 0, '户外运动', '0');

-- ----------------------------
-- Table structure for t_category
-- ----------------------------
DROP TABLE IF EXISTS `t_category`;
CREATE TABLE `t_category`  (
  `cid` int NOT NULL AUTO_INCREMENT,
  `cname` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '标签名称',
  PRIMARY KEY (`cid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of t_category
-- ----------------------------
INSERT INTO `t_category` VALUES (1, '运动');
INSERT INTO `t_category` VALUES (2, '旅游');
INSERT INTO `t_category` VALUES (3, '购物');
INSERT INTO `t_category` VALUES (4, '编程');

-- ----------------------------
-- Table structure for t_link
-- ----------------------------
DROP TABLE IF EXISTS `t_link`;
CREATE TABLE `t_link`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `site_name` varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '站点名',
  `site_url` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '站点地址',
  `site_desc` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '站点描述  简单备注下 ',
  `sort` int NOT NULL DEFAULT 0 COMMENT '排序',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '合作伙伴' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of t_link
-- ----------------------------
INSERT INTO `t_link` VALUES (1, '亚马逊', 'http://www.baidu.com', '电商', 1);
INSERT INTO `t_link` VALUES (2, '淘宝', 'http://www.taobao.com', '电商', 0);

-- ----------------------------
-- Table structure for t_tag
-- ----------------------------
DROP TABLE IF EXISTS `t_tag`;
CREATE TABLE `t_tag`  (
  `tid` int NOT NULL AUTO_INCREMENT COMMENT '主键',
  `tname` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '标签名称',
  `cid` int NULL DEFAULT NULL COMMENT '所属栏目',
  PRIMARY KEY (`tid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 15 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of t_tag
-- ----------------------------
INSERT INTO `t_tag` VALUES (1, '户外运动', 1);
INSERT INTO `t_tag` VALUES (2, '赛艇', 1);
INSERT INTO `t_tag` VALUES (3, '羽毛球', 1);
INSERT INTO `t_tag` VALUES (4, '垒球', 1);
INSERT INTO `t_tag` VALUES (5, '自驾游', 2);
INSERT INTO `t_tag` VALUES (6, '徒步旅游', 2);
INSERT INTO `t_tag` VALUES (7, '飞机旅游', 2);
INSERT INTO `t_tag` VALUES (8, '女装、男装', 3);
INSERT INTO `t_tag` VALUES (9, '家电', 3);
INSERT INTO `t_tag` VALUES (10, '手机、数码', 3);
INSERT INTO `t_tag` VALUES (11, '厨具', 3);
INSERT INTO `t_tag` VALUES (12, 'Java', 4);
INSERT INTO `t_tag` VALUES (13, 'PHP', 4);
INSERT INTO `t_tag` VALUES (14, 'JavaScript', 4);
INSERT INTO `t_tag` VALUES (15, 'Dubbo', 4);

-- ----------------------------
-- Table structure for t_user
-- ----------------------------
DROP TABLE IF EXISTS `t_user`;
CREATE TABLE `t_user`  (
  `uid` int NOT NULL AUTO_INCREMENT COMMENT '主键',
  `username` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户名',
  `nickname` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '昵称',
  `password` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '密码  采取MD5加密',
  `role` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '0:管理员 1:普通用户',
  `createTime` char(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建时间',
  `lastLoginTime` char(19) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '登录时间',
  `state` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '账号是否被锁定 0:锁定 1:未锁定',
  `loginIp` varchar(17) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '登录ip',
  `phone` char(11) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '手机号码',
  `loginCount` int NULL DEFAULT NULL COMMENT '登录次数',
  `img` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户头像',
  PRIMARY KEY (`uid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of t_user
-- ----------------------------
INSERT INTO `t_user` VALUES (1, 'admin', '管理员', '2123fc34a0e4a8012f297a57a5a74389', '1', NULL, '2021-04-20 10:01:21', '1', '0:0:0:0:0:0:0:1', '13739242980', 73, NULL);

SET FOREIGN_KEY_CHECKS = 1;
