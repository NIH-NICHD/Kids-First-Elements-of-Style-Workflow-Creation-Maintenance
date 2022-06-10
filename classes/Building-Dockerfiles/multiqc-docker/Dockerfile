# Dockerfile for multiqc
# https://multiqc.info/
FROM continuumio/miniconda3
ARG ENV_NAME="multiqc"

# Install the conda environment
COPY environment.yml /
RUN conda env create --quiet --name ${ENV_NAME} --file /environment.yml && conda clean -a

# Add conda installation dir to PATH (instead of doing 'conda activate')
ENV PATH /opt/conda/envs/${ENV_NAME}/bin:$PATH
