configfile: "config.yaml"

rule all:
    input:
        expand(["{h5dir}/{project_name}_ad_all.h5ad", "{datadir}/{project_name}_sample_nuclei_counts.tsv", "{datadir}/{project_name}_ad_all.obs.tsv"], h5dir=config["project"]["h5dir"], datadir=config["project"]["datadir"], project_name=config["project"]["project_name"])

rule simple_clean:
    input:
        info=config["files"]["info"]
    output:
        h5ad="{h5dir}/{project_name}_ad_all.h5ad"
        sample_counts="{datadir}/{project_name}_sample_nuclei_counts.tsv"
        obs="{datadir}/{project_name}_ad_all.obs.tsv"
    conda:
        "/proj/sens2022004/nobackup/wharf/hongki/hongki-sens2022004/conda_envs/scanpy"
    script:
        "scripts/qc.py"