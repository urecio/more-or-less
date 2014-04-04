module.exports = function(grunt) {
    require('time-grunt')(grunt);

    grunt.initConfig({
        less: {
            development: {
                options: {},
                files: {
                    "test/test.css": "test/test.less"
                }
            },
            compare: {
                options: {},
                files: {
                    "test/compare-to-lesshat.css": "test/compare-to-lesshat.less"
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

    grunt.registerTask("default", ["less"]);
    grunt.registerTask("dev", ["watch"]);
    grunt.registerTask("compare", ["less:compare"]);
};
