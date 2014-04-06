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
            namespace: {
                options: {},
                files: {
                    "test/namespace.css": "test/namespace.less"
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
        csslint: {
            strict: {
                options: {
                    import: 2,
                    'adjoining-classes': false,
                    'box-sizing': false,
                    'box-model': false,
                    'fallback-colors': false
                },
                src: 'public/css/unprefixed-screen.css'
            }
        },
        watch: {
            styles: {
                files: ["**/*.less"],
                tasks: ["less:development", "notify:less"],
                options: {
                    nospawn: true
                }
            },
            lint: {
                files: ["**/*.less"],
                tasks: ["csslint:strict", "notify:csslint"],
                options: {
                    nospawn: true
                }
            }
        }
    });

    grunt.loadNpmTasks("grunt-contrib-less");
    grunt.loadNpmTasks("grunt-contrib-csslint");
    grunt.loadNpmTasks("grunt-contrib-watch");
    grunt.loadNpmTasks("grunt-notify");

    grunt.registerTask("default", ["less"]);
    grunt.registerTask("dev", ["watch"]);
    grunt.registerTask("compare", ["less:compare"]);
    grunt.registerTask("test", ["less:development", "csslint:strict"]);
    grunt.registerTask("namespace", ["less:namespace"]);
};
