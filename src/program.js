import { Command } from 'commander';

export const createProgram = () => {
    
    const program = new Command();
    program
        .version('0.0.1')
        .option('-i, --input <file name>',  'Path with Photograph file name')
        .option('-o, --output <file name>', "Path to save Polaroid")
        .parse(process.argv);

    const options = program.opts();
    const photo = options.input;
    const polaroid = options.output;

    if(!photo || !polaroid){
        console.error('input photo path and output save path must be provided');
        console.log(`use polaroid --help for more details`);
        process.exit(1);
    }
    return { photo, polaroid };
}