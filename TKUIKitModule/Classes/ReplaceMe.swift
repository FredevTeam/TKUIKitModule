

extension UIApplication: NamespaceWrappable{}
let infoDic = Bundle.main.infoDictionary
extension TypeWrapperProtocol where WrappedType == UIApplication {
    
    /// version
    var version: String? {
        return (infoDic?["CFBundleShortVersionString"] as? String) ?? ""
    }
    
    /// build version
    var buildVersion: String? {
        return (infoDic?["CFBundleVersion"] as? String) ?? ""
    }
    
    /// name
    var name: String? {
        return (infoDic?["CFBundleDisplayName"] as? String) ?? ""
    }
    
    ///  identifier
    var identifier: String? {
        return (infoDic?["CFBundleIdentifier"] as? String) ?? ""
    }
    
    /// namespace
    var namespace: String? {
        return  (infoDic?["CFBundleExecutable"] as? String) ?? ""
    }
}
