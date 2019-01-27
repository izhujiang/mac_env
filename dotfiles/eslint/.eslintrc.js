module.exports = {
  extends: 'fbjs',
  plugins: ['prettier'],
  rules: {
    'prettier/prettier': ['error', 'fb'],
    /*   "prettier/prettier": ["error", {
    "singleQuote": true,
    "trailingComma": "all",
    "bracketSpacing": false,
    "jsxBracketSameLine": true,
    "parser": "flow"
    }
    ] */
  },
};
