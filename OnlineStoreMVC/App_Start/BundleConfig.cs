using System.Web;
using System.Web.Optimization;

namespace OnlineStoreMVC
{
    public class BundleConfig
    {
        // For more information on bundling, visit http://go.microsoft.com/fwlink/?LinkId=301862
        public static void RegisterBundles(BundleCollection bundles)
        {
            bundles.Add(new ScriptBundle("~/bundles/jquery").Include(
                        "~/Scripts/jquery-{version}.js"));

            bundles.Add(new ScriptBundle("~/bundles/jqueryval").Include(
                        "~/Scripts/jquery.validate*"));

            // Use the development version of Modernizr to develop with and learn from. Then, when you're
            // ready for production, use the build tool at http://modernizr.com to pick only the tests you need.
            bundles.Add(new ScriptBundle("~/bundles/modernizr").Include(
                        "~/Scripts/modernizr-*"));

            bundles.Add(new ScriptBundle("~/bundles/bootstrap").Include(
                      "~/Scripts/bootstrap.js",
                      "~/Scripts/respond.js"));

            bundles.Add(new StyleBundle("~/Content/css").Include(
                      "~/Content/bootstrap.css",
                      "~/Content/site.css"));

            // Admin page 
            bundles.Add(new ScriptBundle("~/bundles/adminScript").Include(
                      "~/Scripts/bootstrap.js",
                      "~/Scripts/respond.js",
                       "~/Scripts/Utility/common.js"
                      ));

            bundles.Add(new StyleBundle("~/Content/adminCss").Include(
                      "~/Content/bootstrap.css",
                      "~/Content/TemplateAmin/assets/css/animate.min.css",
                      "~/Content/TemplateAmin/assets/css/light-bootstrap-dashboard.css",
                      "~/Content/TemplateAmin/assets/css/pe-icon-7-stroke.css",
                      "~/Content/common.css",
                      "~/Content/TemplateAmin/product-management.css"
                      ));

            bundles.Add(new ScriptBundle("~/bundles/brandManagement").Include(
                       "~/Scripts/Admin/brand-management.js"
                      ));
        }
    }
}
