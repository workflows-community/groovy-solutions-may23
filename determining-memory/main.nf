
process counter{

   //memory = { samplefile.size() < 100.B ? 1.GB : 5.GB }
   
   debug true

   input:
   path samplefile

   shell:
   '''
   wc -l !{samplefile}
   '''
}

workflow {
  samplefile_channel = Channel.fromPath( 'files/*.txt' )
  samplefile_channel | counter 
}
