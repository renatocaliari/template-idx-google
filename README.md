# template-idx-google
idx.google.com: template with Cline and Aider Chat

Get started by customizing your environment (defined in the .idx/dev.nix file) with the tools and IDE extensions you'll need for your project!
Learn more at https://developers.google.com/idx/guides/customize-idx-env

## Next steps:
- Open idx.google.com
- Click on "Import a repo".
- Set Repo Url to "https://github.com/renatocaliari/template-idx-google".
- After the workspace is ready, adjust the "GEMINI_API_KEY" variable in the .env file. It's for Aider (or choose other LLM for Aider). Get your GEMINI api key here: https://aistudio.google.com/.
- Set the preview params related to your tech and framework.
- Rebuild your Environment.
- Set your api key on Cline (prev. Claude Dev) Extension.
- Click on the engine icon of Vs Code, click on Settings. Search for "Files: Auto Guess Encoding" and check in the 3 tabs found. It helps to avoid Cline using "&lt" and "&gt" instead of correct "<" and ">".
- Open the terminal.
- Run the command: `pipx run aider-chat --model gemini/gemini-1.5-flash-002`
- Done! Now you have Cline, Aider-Chat and Gemini (built-in).


