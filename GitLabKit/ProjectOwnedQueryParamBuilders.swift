//
//  ProjectOwnedQueryParamBuilders.swift
//  GitLabKit
//
//  Copyright (c) 2017 toricls. All rights reserved.
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in
//  all copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
//  THE SOFTWARE.

import Foundation

open class ProjectOwnedQueryParamBuilder: GeneralQueryParamBuilder {
    
    init(projectId: UInt) {
        super.init()
        params["projectId"] = projectId as AnyObject
    }
    init(projectName: String, namespace: String) {
        super.init()
        params["namespaceAndName"] = "\(namespace)/\(projectName)" as AnyObject
    }
    
}

// MARK: ProjectIssues

open class ProjectIssueQueryParamBuilder : IssueQueryParamBuilder {
    init(projectId: UInt) {
        super.init()
        params["projectId"] = projectId as AnyObject
    }
    init(projectName: String, namespace: String) {
        super.init()
        params["namespaceAndName"] = "\(namespace)/\(projectName)" as AnyObject
    }
    
    open func issueId(_ issueId: UInt) -> Self {
        if params["issueId"] != nil {
            return self
        }
        params["issueId"] = issueId as AnyObject
        return self
    }
    
    open func milestone(_ milestone: String) -> Self {
        if !milestone.isEmpty {
            params["milestone"] = milestone.trim() as AnyObject
        }
        return self
    }
}

// MARK: ProjectMembers

open class ProjectMemberQueryParamBuilder : ProjectOwnedQueryParamBuilder {
    open func userId(_ userId: UInt) -> Self {
        if params["userId"] != nil {
            return self
        }
        params["userId"] = userId as AnyObject
        return self
    }
}

// MARK: ProjectEvents

open class ProjectEventQueryParamBuilder: ProjectOwnedQueryParamBuilder {}

// MARK: ProjectMergeRequests

open class ProjectMergeRequestQueryParamBuilder: ProjectOwnedQueryParamBuilder {
    
    open func state(_ state: MergeRequestState) -> Self {
        params["state"] = state.rawValue as AnyObject
        return self
    }
    
    open func orderBy(_ order: MergeRequestOrderBy?) -> Self {
        params["order_by"] = order?.rawValue as AnyObject
        return self
    }
    
    open func sort(_ sort: MergeRequestSort?) -> Self {
        params["sort"] = sort?.rawValue as AnyObject
        return self
    }
    
}

// MARK: ProjectBranches

open class ProjectBranchQueryParamBuilder : ProjectOwnedQueryParamBuilder {
    open func branchName(_ name: String) -> Self {
        if params["name"] != nil {
            return self
        }
        
        params["name"] = name as AnyObject
        return self
    }
}

// MARK: ProjectHooks

open class ProjectHookQueryParamBuilder: ProjectOwnedQueryParamBuilder {
    open func hookId(_ hookId: UInt) -> Self {
        if params["hookId"] != nil {
            return self
        }
        params["hookId"] = hookId as AnyObject
        return self
    }
}

// MARK: ProjectSnippets

open class ProjectSnippetQueryParamBuilder: ProjectOwnedQueryParamBuilder {
    open func snippetId(_ snippetId: UInt) -> Self {
        if params["snippetId"] != nil {
            return self
        }
        params["snippetId"] = snippetId as AnyObject
        return self
    }
}

// MARK: ProjectFiles

open class ProjectFileQueryParamBuilder: GeneralQueryParamBuilder {
    /**
    initializer
    
    :param: projectId
    :param: filePath  Full path to new file. Ex. lib/class.rb
    :param: ref       The name of branch, tag or commit
    
    :returns: ProjectFileQueryParamBuilder
    */
    init(projectId: UInt, filePath: String, ref: String) {
        super.init()
        params["projectId"] = projectId as AnyObject
        params["file_path"] = filePath as AnyObject
        params["ref"] = ref as AnyObject
    }
    init(projectName: String, namespace: String, filePath: String, ref: String) {
        super.init()
        params["namespaceAndName"] = "\(namespace)/\(projectName)" as AnyObject
        params["file_path"] = filePath as AnyObject
        params["ref"] = ref as AnyObject
    }
}

// MARK: ProjectTags

open class ProjectTagQueryParamBuilder: ProjectOwnedQueryParamBuilder {}

// MARK: ProjectTrees

open class ProjectTreeQueryParamBuilder: ProjectOwnedQueryParamBuilder {
    /**
    Specify the path inside repository
    
    :param: path The path inside repository. Used to get contend of subdirectories
    */
    open func path(_ path: String) -> Self {
        params["path"] = path as AnyObject
        return self
    }
    
    /**
    Specify the name of a repository branch or tag
    
    :param: refName The name of a repository branch or tag or if not given the default branch
    */
    open func refName(_ refName: String) -> Self {
        params["refName"] = refName as AnyObject
        return self
    }
}

// MARK: ProjectCommits

open class ProjectCommitQueryParamBuilder: ProjectOwnedQueryParamBuilder {
    /**
    Specify the name of a repository branch or tag
    
    :param: refName The name of a repository branch or tag or if not given the default branch
    */
    open func refName(_ refName: String) -> Self {
        params["refName"] = refName as AnyObject
        return self
    }
    
    open func sha(_ sha: String) -> Self {
        params["sha"] = sha as AnyObject
        return self
    }
}

// MARK: Comment For ProjectCommits

open class ProjectCommentForCommitQueryParamBuilder: GeneralQueryParamBuilder {
    init(projectId: UInt, commitSha: String) {
        super.init()
        params["projectId"] = projectId as AnyObject
        params["sha"] = commitSha as AnyObject
    }
    init(projectName: String, namespace: String, commitSha: String) {
        super.init()
        params["namespaceAndName"] = "\(namespace)/\(projectName)" as AnyObject
        params["sha"] = commitSha as AnyObject
    }
}

// MARK: Comment For ProjectIssues

open class ProjectCommentForIssueQueryParamBuilder : IssueQueryParamBuilder {
    init(projectId: UInt, issueId: UInt) {
        super.init()
        params["projectId"] = projectId as AnyObject
        params["issueId"] = issueId as AnyObject
    }
    init(projectName: String, namespace: String, issueId: UInt) {
        super.init()
        params["namespaceAndName"] = "\(namespace)/\(projectName)" as AnyObject
        params["issueId"] = issueId as AnyObject
    }
    
    open func noteId(_ noteId: String) -> Self {
        if params["noteId"] != nil {
            return self
        }
        params["noteId"] = noteId as AnyObject
        return self
    }
}

// MARK: Comment For ProjectSnippets

open class ProjectCommentForSnippetQueryParamBuilder : IssueQueryParamBuilder {
    init(projectId: UInt, snippetId: UInt) {
        super.init()
        params["projectId"] = projectId as AnyObject
        params["snippetId"] = snippetId as AnyObject
    }
    init(projectName: String, namespace: String, snippetId: UInt) {
        super.init()
        params["namespaceAndName"] = "\(namespace)/\(projectName)" as AnyObject
        params["snippetId"] = snippetId as AnyObject
    }
    
    open func noteId(_ noteId: String) -> Self {
        if params["noteId"] != nil {
            return self
        }
        params["noteId"] = noteId as AnyObject
        return self
    }
}

// MARK: ProjectDiff

open class ProjectDiffQueryParamBuilder: ProjectCommentForCommitQueryParamBuilder {}

// MARK: ProjectRawfile
// TODO: Handle Project Rawfile
// Raw file content
// Raw blob content
// Get file archive
/*public class ProjectRawfileQueryParamBuilder : GeneralQueryParamBuilder, GitLabParamBuildable {
    
    init(projectId: UInt, sha: String, filePath: String) {
        super.init()
        params["projectId"] = projectId
    }
    init(projectName: String, namespace: String, sha: String, filePath: String) {
        super.init()
        params["namespaceAndName"] = "\(namespace)/\(projectName)"
    }
    
    public func build() -> [String : AnyObject]? {
        return params
    }
}*/
