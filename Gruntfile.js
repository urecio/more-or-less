module.exports = function(grunt) {
    grunt.initConfig({
        less: {
            development: {
                options: {},
                files: {
                    "test/test.css": "test/test.less"
                }
            }
        },
        notify: {
            less: {
                options: {
                    title: "Success",
                    message: "All .less files have been compiled"
                }
            }
        },
        watch: {
            styles: {
                files: ["**/*.less"],
                tasks: ["less:development","notify:less"],
                options: {
                    nospawn: true
                }
            }
        }
    });

    grunt.loadNpmTasks("grunt-contrib-less");
    grunt.loadNpmTasks("grunt-contrib-watch");
    grunt.loadNpmTasks("grunt-notify");

    grunt.registerTask("dev", ["watch"]);
};
