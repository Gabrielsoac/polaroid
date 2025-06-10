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
        console.error('source and file must be provided');
        console.log(`SOURCE: ${photo}, FILE ${polaroid}`);
        process.exit(1);
    }
    return { photo, polaroid };
}