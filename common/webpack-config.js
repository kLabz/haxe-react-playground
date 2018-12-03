const path = require('path');

const webpack = require('webpack');
const HtmlWebpackPlugin = require('html-webpack-plugin');
const FriendlyErrorsWebpackPlugin = require('friendly-errors-webpack-plugin');
const haxeErrorParser = require('haxe-error-parser');

module.exports = function(config) {
    const DEV_SERVER_PORT = config.serverPort || 9000;
    const dirname = config.dirname || path.resolve(__dirname, '..');

    const isProd = !!config.isProd;
    const useFriendlyErrors = !!config.useFriendlyErrors;

    const sourcemapsMode = !isProd ? 'eval-source-map' : undefined;
    const dist = path.resolve(dirname, '.build');

    const plugins = [
        new HtmlWebpackPlugin({
            template: path.resolve(__dirname, 'res/index.pug')
        }),
    ];

    if (useFriendlyErrors)
        plugins.push(
            new FriendlyErrorsWebpackPlugin({
                compilationSuccessInfo: {
                    messages: [
                        `Your application is running here: http${!!config.isHttps ? 's' : ''}://localhost:${DEV_SERVER_PORT}`
                    ],
                    notes: []
                },
                additionalTransformers: [haxeErrorParser.transform],
                additionalFormatters: [haxeErrorParser.format]
            })
        );

    return {
        mode: isProd ? "production" : "development",
        entry: {
            app: './build.hxml'
        },
        output: {
            path: dist,
            filename: '[name].js',
            publicPath: '/'
        },
        resolve: {
            modules: ['node_modules'],
            extensions: ['.js']
        },
        devtool: sourcemapsMode,
        devServer: {
            contentBase: dist,
            compress: true,
            quiet: useFriendlyErrors,
            port: DEV_SERVER_PORT,
            https: !!config.isHttps,
            overlay: true,
            historyApiFallback: true,
        },
        module: {
            rules: [
                {
                    test: /\.hxml$/,
                    loader: 'haxe-loader',
                    options: {
                        debug: !isProd,
                        server: process.env.HAXE_COMPILATION_SERVER,
                        emitModularOutputAsWarning: true,
                        emitStdoutAsWarning: useFriendlyErrors,
                        extra: (isProd ? '-dce full' : '-D dev')
                    }
                },
                {
                  test: /\.pug$/,
                  loader: 'pug-loader'
                },
                {
                    test: /\.(gif|png|jpg|svg)$/,
                    loader: 'file-loader',
                    options: {
                        name: '[name].[hash:7].[ext]',
                        options: {
                            includePaths: [path.resolve(__dirname, 'assets')]
                        }
                    }
                }
            ]
        },
        plugins: plugins
    };
}

