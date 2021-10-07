
import 'dart:convert';

IssueDetailsModel issueDetailsModelFromJson(String str) => IssueDetailsModel.fromJson(json.decode(str));

String issueDetailsModelToJson(IssueDetailsModel data) => json.encode(data.toJson());

class IssueDetailsModel {
    IssueDetailsModel({
        this.url,
        this.repositoryUrl,
        this.labelsUrl,
        this.commentsUrl,
        this.eventsUrl,
        this.htmlUrl,
        this.id,
        this.nodeId,
        this.number,
        this.title,
        this.user,
        this.labels,
        this.state,
        this.locked,
        this.assignee,
        this.assignees,
        this.milestone,
        this.comments,
        this.createdAt,
        this.updatedAt,
        this.closedAt,
        this.authorAssociation,
        this.activeLockReason,
        this.body,
        this.closedBy,
        this.reactions,
        this.timelineUrl,
        this.performedViaGithubApp,
    });

    String url;
    String repositoryUrl;
    String labelsUrl;
    String commentsUrl;
    String eventsUrl;
    String htmlUrl;
    int id;
    String nodeId;
    int number;
    String title;
    User user;
    List<Label> labels;
    String state;
    bool locked;
    dynamic assignee;
    List<dynamic> assignees;
    dynamic milestone;
    int comments;
    DateTime createdAt;
    DateTime updatedAt;
    dynamic closedAt;
    String authorAssociation;
    dynamic activeLockReason;
    String body;
    dynamic closedBy;
    Reactions reactions;
    String timelineUrl;
    dynamic performedViaGithubApp;

    factory IssueDetailsModel.fromJson(Map<String, dynamic> json) => IssueDetailsModel(
        url: json["url"],
        repositoryUrl: json["repository_url"],
        labelsUrl: json["labels_url"],
        commentsUrl: json["comments_url"],
        eventsUrl: json["events_url"],
        htmlUrl: json["html_url"],
        id: json["id"],
        nodeId: json["node_id"],
        number: json["number"],
        title: json["title"],
        user: User.fromJson(json["user"]),
        labels: List<Label>.from(json["labels"].map((x) => Label.fromJson(x))),
        state: json["state"],
        locked: json["locked"],
        assignee: json["assignee"],
        assignees: List<dynamic>.from(json["assignees"].map((x) => x)),
        milestone: json["milestone"],
        comments: json["comments"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        closedAt: json["closed_at"],
        authorAssociation: json["author_association"],
        activeLockReason: json["active_lock_reason"],
        body: json["body"],
        closedBy: json["closed_by"],
        reactions: Reactions.fromJson(json["reactions"]),
        timelineUrl: json["timeline_url"],
        performedViaGithubApp: json["performed_via_github_app"],
    );

    Map<String, dynamic> toJson() => {
        "url": url,
        "repository_url": repositoryUrl,
        "labels_url": labelsUrl,
        "comments_url": commentsUrl,
        "events_url": eventsUrl,
        "html_url": htmlUrl,
        "id": id,
        "node_id": nodeId,
        "number": number,
        "title": title,
        "user": user.toJson(),
        "labels": List<dynamic>.from(labels.map((x) => x.toJson())),
        "state": state,
        "locked": locked,
        "assignee": assignee,
        "assignees": List<dynamic>.from(assignees.map((x) => x)),
        "milestone": milestone,
        "comments": comments,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "closed_at": closedAt,
        "author_association": authorAssociation,
        "active_lock_reason": activeLockReason,
        "body": body,
        "closed_by": closedBy,
        "reactions": reactions.toJson(),
        "timeline_url": timelineUrl,
        "performed_via_github_app": performedViaGithubApp,
    };
}

class Label {
    Label({
        this.id,
        this.nodeId,
        this.url,
        this.name,
        this.color,
        this.labelDefault,
        this.description,
    });

    int id;
    String nodeId;
    String url;
    String name;
    String color;
    bool labelDefault;
    String description;

    factory Label.fromJson(Map<String, dynamic> json) => Label(
        id: json["id"],
        nodeId: json["node_id"],
        url: json["url"],
        name: json["name"],
        color: json["color"],
        labelDefault: json["default"],
        description: json["description"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "node_id": nodeId,
        "url": url,
        "name": name,
        "color": color,
        "default": labelDefault,
        "description": description,
    };
}

class Reactions {
    Reactions({
        this.url,
        this.totalCount,
        this.the1,
        this.reactions1,
        this.laugh,
        this.hooray,
        this.confused,
        this.heart,
        this.rocket,
        this.eyes,
    });

    String url;
    int totalCount;
    int the1;
    int reactions1;
    int laugh;
    int hooray;
    int confused;
    int heart;
    int rocket;
    int eyes;

    factory Reactions.fromJson(Map<String, dynamic> json) => Reactions(
        url: json["url"],
        totalCount: json["total_count"],
        the1: json["+1"],
        reactions1: json["-1"],
        laugh: json["laugh"],
        hooray: json["hooray"],
        confused: json["confused"],
        heart: json["heart"],
        rocket: json["rocket"],
        eyes: json["eyes"],
    );

    Map<String, dynamic> toJson() => {
        "url": url,
        "total_count": totalCount,
        "+1": the1,
        "-1": reactions1,
        "laugh": laugh,
        "hooray": hooray,
        "confused": confused,
        "heart": heart,
        "rocket": rocket,
        "eyes": eyes,
    };
}

class User {
    User({
        this.login,
        this.id,
        this.nodeId,
        this.avatarUrl,
        this.gravatarId,
        this.url,
        this.htmlUrl,
        this.followersUrl,
        this.followingUrl,
        this.gistsUrl,
        this.starredUrl,
        this.subscriptionsUrl,
        this.organizationsUrl,
        this.reposUrl,
        this.eventsUrl,
        this.receivedEventsUrl,
        this.type,
        this.siteAdmin,
    });

    String login;
    int id;
    String nodeId;
    String avatarUrl;
    String gravatarId;
    String url;
    String htmlUrl;
    String followersUrl;
    String followingUrl;
    String gistsUrl;
    String starredUrl;
    String subscriptionsUrl;
    String organizationsUrl;
    String reposUrl;
    String eventsUrl;
    String receivedEventsUrl;
    String type;
    bool siteAdmin;

    factory User.fromJson(Map<String, dynamic> json) => User(
        login: json["login"],
        id: json["id"],
        nodeId: json["node_id"],
        avatarUrl: json["avatar_url"],
        gravatarId: json["gravatar_id"],
        url: json["url"],
        htmlUrl: json["html_url"],
        followersUrl: json["followers_url"],
        followingUrl: json["following_url"],
        gistsUrl: json["gists_url"],
        starredUrl: json["starred_url"],
        subscriptionsUrl: json["subscriptions_url"],
        organizationsUrl: json["organizations_url"],
        reposUrl: json["repos_url"],
        eventsUrl: json["events_url"],
        receivedEventsUrl: json["received_events_url"],
        type: json["type"],
        siteAdmin: json["site_admin"],
    );

    Map<String, dynamic> toJson() => {
        "login": login,
        "id": id,
        "node_id": nodeId,
        "avatar_url": avatarUrl,
        "gravatar_id": gravatarId,
        "url": url,
        "html_url": htmlUrl,
        "followers_url": followersUrl,
        "following_url": followingUrl,
        "gists_url": gistsUrl,
        "starred_url": starredUrl,
        "subscriptions_url": subscriptionsUrl,
        "organizations_url": organizationsUrl,
        "repos_url": reposUrl,
        "events_url": eventsUrl,
        "received_events_url": receivedEventsUrl,
        "type": type,
        "site_admin": siteAdmin,
    };
}
